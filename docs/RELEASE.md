# Release checklist (maintainers)

Each release: validate → review → tag → publish → verify.

## 1. Validate (all green on main)

```powershell
powershell scripts/validate.ps1          # spec: names, descriptions, sections
python scripts/check_frontmatter.py      # strict YAML (npx-grade)
python mcp-server/test_smoke.py          # MCP protocol
```

Plus: `gh run list --limit 1` shows success on main
(validate + install-smoke win/ubuntu + mcp-smoke win/ubuntu + frontmatter).

## 2. Review the diff since last tag

```bash
git log --oneline <last-tag>..main
```

Check: `registry.json` count matches `skills/` + `workflows/` dirs,
`wiki/` has no stale pages, `SKILLS.md` and `site/skills.json` regenerated,
README counts match (`<n> lightweight`, wiki categories line, registry line).

## 3. Tag and publish

```bash
git tag -a vX.Y.Z -m "vX.Y.Z: <one-liner>"
git push origin vX.Y.Z
gh release create vX.Y.Z --generate-notes
```

Versioning: new skills/workflows = minor; breaking renames/removals = major;
fixes and docs = patch.

## 4. Verify the live surfaces (within 10 minutes)

- Release page exists with notes.
- Website serves the new count: https://OPEN-CID.github.io/hornet-swarm/
  (Pages builds from `main` `/site`; check the hero stats + search one new skill).
- Spot-install one skill via `npx -y skills add OPEN-CID/hornet-swarm`.

## 5. Announce (optional)

Changelog snippet = `git log --oneline` highlights grouped by
skills / workflows / tooling / docs. Post where the community lives.
