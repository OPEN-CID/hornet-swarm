#!/usr/bin/env python3
"""hornet-swarm skill library as an MCP server - zero dependencies.

Exposes any skills directory (this repo's skills/ or an installed subset
such as .agents/skills) to ANY MCP-capable agent through three tools:
list_skills, search_skills, get_skill.

Usage:
    python mcp-server/server.py [--dir PATH_TO_SKILLS]
    python mcp-server/server.py --dir .agents/skills

Protocol: newline-delimited JSON-RPC 2.0 over stdio (initialize,
notifications/initialized, tools/list, tools/call, ping).
"""
import json
import os
import re
import sys

PROTOCOL_VERSION = "2024-11-05"


def parse_skill(path):
    """Return dict(name, description, category, triggers, body) or None."""
    try:
        with open(path, encoding="utf-8") as f:
            text = f.read()
    except OSError:
        return None
    m = re.match(r"(?s)^---\s*\n(.*?)\n---\s*\n?(.*)$", text)
    if not m:
        return None
    fm, body = m.group(1), m.group(2)
    def field(key):
        mm = re.search(r"(?m)^\s*" + re.escape(key) + r":\s*(.+?)\s*$", fm)
        return mm.group(1).strip() if mm else ""
    trigs = [t.strip() for t in field("triggers").split(",") if t.strip()]
    return {
        "name": field("name") or os.path.basename(os.path.dirname(path)),
        "description": field("description"),
        "category": field("category"),
        "triggers": trigs,
        "body": body.strip(),
    }


def load_skills(root):
    skills = {}
    if not os.path.isdir(root):
        return skills
    for name in sorted(os.listdir(root)):
        p = os.path.join(root, name, "SKILL.md")
        if not os.path.isfile(p):
            continue
        s = parse_skill(p)
        if s and s["name"]:
            skills[s["name"]] = s
    return skills


def search(skills, query, limit=10):
    toks = [t for t in re.findall(r"[a-z0-9]+", query.lower()) if len(t) > 1]
    if not toks:
        toks = query.lower().split()
    hits = []
    for s in skills.values():
        score = 0
        nm, ds, cat = s["name"].lower(), s["description"].lower(), s["category"].lower()
        trg = " ".join(s["triggers"]).lower()
        for t in toks:
            if t in nm:
                score += 3
            if t in trg:
                score += 2
            if t in ds:
                score += 1
            if t in cat:
                score += 1
        if score > 0:
            hits.append((score, s))
    hits.sort(key=lambda h: (-h[0], h[1]["name"]))
    return [
        {"name": s["name"], "description": s["description"],
         "category": s["category"], "score": sc}
        for sc, s in hits[: max(1, limit)]
    ]


def tool_defs():
    return [
        {"name": "list_skills",
         "description": "List available skills (name, description, category). Use first to see what exists. Optional category filter.",
         "inputSchema": {"type": "object",
                         "properties": {"category": {"type": "string"}},
                         "additionalProperties": False}},
        {"name": "search_skills",
         "description": "Keyword-search skills by task. Returns ranked matches. Use when the task matches no obvious skill.",
         "inputSchema": {"type": "object",
                         "properties": {"query": {"type": "string"},
                                        "limit": {"type": "integer", "default": 10}},
                         "required": ["query"],
                         "additionalProperties": False}},
        {"name": "get_skill",
         "description": "Get a skill's full SKILL.md instructions by name. Call this before doing the task.",
         "inputSchema": {"type": "object",
                         "properties": {"name": {"type": "string"}},
                         "required": ["name"],
                         "additionalProperties": False}},
    ]


def text_result(text):
    return {"content": [{"type": "text", "text": text}]}


def main():
    root = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "skills")
    args = sys.argv[1:]
    i = 0
    while i < len(args):
        if args[i] == "--dir" and i + 1 < len(args):
            root = args[i + 1]
            i += 2
        else:
            i += 1
    skills = load_skills(root)

    out = sys.stdout

    def send(obj):
        out.write(json.dumps(obj) + "\n")
        out.flush()

    def err(req_id, code, message):
        send({"jsonrpc": "2.0", "id": req_id, "error": {"code": code, "message": message}})

    for line in sys.stdin:
        line = line.strip()
        if not line:
            continue
        try:
            req = json.loads(line)
        except json.JSONDecodeError:
            continue
        if not isinstance(req, dict) or req.get("jsonrpc") != "2.0":
            continue
        method = req.get("method", "")
        req_id = req.get("id")
        params = req.get("params") or {}
        if method == "notifications/initialized":
            continue
        if req_id is None:
            continue
        if method == "initialize":
            send({"jsonrpc": "2.0", "id": req_id,
                  "result": {"protocolVersion": PROTOCOL_VERSION,
                             "capabilities": {"tools": {}},
                             "serverInfo": {"name": "hornet-swarm-skills",
                                            "version": "1.0.0"}}})
        elif method == "ping":
            send({"jsonrpc": "2.0", "id": req_id, "result": {}})
        elif method == "tools/list":
            send({"jsonrpc": "2.0", "id": req_id,
                  "result": {"tools": tool_defs()}})
        elif method == "tools/call":
            tname = params.get("name", "")
            targs = params.get("arguments") or {}
            if tname == "list_skills":
                cat = (targs.get("category") or "").strip().lower()
                items = [s for s in skills.values()
                         if not cat or s["category"].lower() == cat]
                items.sort(key=lambda s: s["name"])
                payload = [{"name": s["name"], "description": s["description"],
                            "category": s["category"]} for s in items]
                send({"jsonrpc": "2.0", "id": req_id,
                      "result": text_result(json.dumps(payload, indent=1))})
            elif tname == "search_skills":
                q = targs.get("query", "")
                try:
                    lim = int(targs.get("limit", 10))
                except (TypeError, ValueError):
                    lim = 10
                if not q.strip():
                    err(req_id, -32602, "query is required")
                else:
                    send({"jsonrpc": "2.0", "id": req_id,
                          "result": text_result(
                              json.dumps(search(skills, q, lim), indent=1))})
            elif tname == "get_skill":
                nm = (targs.get("name") or "").strip()
                s = skills.get(nm)
                if not s:
                    err(req_id, -32602, "unknown skill: " + nm)
                else:
                    send({"jsonrpc": "2.0", "id": req_id,
                          "result": text_result(
                              "# " + s["name"] + "\n\n" + s["body"])})
            else:
                err(req_id, -32601, "unknown tool: " + tname)
        else:
            err(req_id, -32601, "method not found: " + method)


if __name__ == "__main__":
    main()
