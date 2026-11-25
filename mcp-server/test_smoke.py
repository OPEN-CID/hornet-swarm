"""Smoke test for mcp-server/server.py - stdlib only, no network, no deps.

Spawns the server over stdio, runs initialize/list/search/get plus two
error paths, and asserts on every response. Exit 0 = healthy.
Usage: python mcp-server/test_smoke.py [--dir PATH_TO_SKILLS]
"""
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.abspath(__file__))
SERVER = os.path.join(ROOT, "server.py")
DEFAULT_DIR = os.path.normpath(os.path.join(ROOT, "..", "skills"))


def main():
    skills_dir = DEFAULT_DIR
    args = sys.argv[1:]
    if "--dir" in args:
        skills_dir = args[args.index("--dir") + 1]
    reqs = [
        {"jsonrpc": "2.0", "id": 1, "method": "initialize",
         "params": {"protocolVersion": "2024-11-05", "capabilities": {},
                    "clientInfo": {"name": "smoke", "version": "0"}}},
        {"jsonrpc": "2.0", "id": 2, "method": "tools/list"},
        {"jsonrpc": "2.0", "id": 3, "method": "tools/call",
         "params": {"name": "search_skills",
                    "arguments": {"query": "snowflake data warehouse",
                                  "limit": 3}}},
        {"jsonrpc": "2.0", "id": 4, "method": "tools/call",
         "params": {"name": "get_skill", "arguments": {"name": "meal-plan"}}},
        {"jsonrpc": "2.0", "id": 5, "method": "tools/call",
         "params": {"name": "get_skill",
                    "arguments": {"name": "no-such-skill"}}},
        {"jsonrpc": "2.0", "id": 6, "method": "bogus/method"},
    ]
    payload = "\n".join(json.dumps(r) for r in reqs) + "\n"
    try:
        proc = subprocess.run(
            [sys.executable, SERVER, "--dir", skills_dir],
            input=payload, capture_output=True, text=True, timeout=60)
    except FileNotFoundError as e:
        print("FAIL: cannot start server: " + str(e))
        return 1
    if proc.returncode != 0 and not proc.stdout.strip():
        print("FAIL: server exited: " + proc.stderr[-500:])
        return 1
    by_id = {}
    for line in proc.stdout.splitlines():
        line = line.strip()
        if not line:
            continue
        try:
            msg = json.loads(line)
        except json.JSONDecodeError:
            print("FAIL: non-JSON output: " + line[:120])
            return 1
        if "id" in msg:
            by_id[msg["id"]] = msg

    def check(cond, label):
        if not cond:
            print("FAIL: " + label)
            return False
        print("ok: " + label)
        return True

    ok = True
    r1 = by_id.get(1, {})
    ok &= check(r1.get("result", {}).get("protocolVersion") == "2024-11-05",
                "initialize handshake")
    tools = by_id.get(2, {}).get("result", {}).get("tools", [])
    names = sorted(t.get("name", "") for t in tools)
    ok &= check(names == ["get_skill", "list_skills", "search_skills"],
                "tools/list exposes 3 tools")
    hits = json.loads(by_id.get(3, {}).get("result", {})
                      .get("content", [{}])[0].get("text", "[]"))
    ok &= check(isinstance(hits, list) and len(hits) > 0
                and hits[0]["name"] == "snowflake-guide",
                "search ranks snowflake-guide first")
    body = by_id.get(4, {}).get("result", {}).get("content", [{}])[0] \
        .get("text", "")
    ok &= check("## What I do" in body and "meal-plan" in body,
                "get_skill returns full SKILL.md")
    ok &= check(by_id.get(5, {}).get("error", {}).get("code") == -32602,
                "unknown skill -> -32602")
    ok &= check(by_id.get(6, {}).get("error", {}).get("code") == -32601,
                "unknown method -> -32601")
    print("MCP smoke: " + ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
