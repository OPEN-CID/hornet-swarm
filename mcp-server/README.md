# hornet-swarm skills as an MCP server (zero dependencies)

`server.py` exposes **any** skills directory to **any** MCP-capable agent
through 3 tools: `list_skills`, `search_skills`, `get_skill`. Stdlib Python
only, stdio JSON-RPC, no install step.

```bash
# serve this repo's library
python mcp-server/server.py --dir skills
# or serve an installed subset (e.g. your project's .agents/skills)
python mcp-server/server.py --dir .agents/skills
```

## Connect your tool (adjust absolute paths)

**Claude Code** (project scope; add `--scope user` for global):
```bash
claude mcp add --transport stdio hornet-skills -- python /abs/hornet-swarm/mcp-server/server.py --dir /abs/hornet-swarm/skills
```

**Cursor** — Settings → MCP → New MCP Server:
```json
{ "command": "python",
  "args": ["/abs/hornet-swarm/mcp-server/server.py", "--dir", "/abs/hornet-swarm/skills"] }
```

**Copilot (VS Code)** — `.vscode/mcp.json`:
```json
{ "servers": { "hornet-skills": {
  "type": "stdio", "command": "python",
  "args": ["/abs/hornet-swarm/mcp-server/server.py", "--dir", "/abs/hornet-swarm/skills"] } } }
```

**Codex CLI** — `~/.codex/config.toml`:
```toml
[mcp_servers.hornet-skills]
command = "python"
args = ["/abs/hornet-swarm/mcp-server/server.py", "--dir", "/abs/hornet-swarm/skills"]
```

**Gemini CLI** — `~/.gemini/settings.json`:
```json
{ "mcpServers": { "hornet-skills": {
  "command": "python",
  "args": ["/abs/hornet-swarm/mcp-server/server.py", "--dir", "/abs/hornet-swarm/skills"] } } }
```

Verify in any client: call `search_skills` with e.g. `{"query": "sourdough"}`
— you should get `sourdough-starter` back, then `get_skill` for the full text.
