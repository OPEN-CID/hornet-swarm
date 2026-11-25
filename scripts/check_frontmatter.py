#!/usr/bin/env python3
"""Strict frontmatter check for all skills and workflows (stdlib + pyyaml).

Lenient readers (Claude Code) tolerate bad YAML by dropping fields; strict
ones (npx skills CLI, skills-ref) skip the skill entirely. This gate keeps
every SKILL.md parseable by the strictest consumer.

Usage: python scripts/check_frontmatter.py
Requires: pyyaml (pip install pyyaml)
"""
import os
import re
import sys

try:
    import yaml
except ImportError:
    print("FAIL: pyyaml is required (pip install pyyaml)")
    sys.exit(1)

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NAME_RE = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
FM_RE = re.compile(r"(?s)^---\s*\n(.*?)\n---\s*\n?")


def main():
    bad = 0
    total = 0
    for root in ("skills", "workflows"):
        base = os.path.join(ROOT, root)
        if not os.path.isdir(base):
            continue
        for name in sorted(os.listdir(base)):
            path = os.path.join(base, name, "SKILL.md")
            if not os.path.isfile(path):
                continue
            total += 1
            try:
                with open(path, encoding="utf-8") as f:
                    text = f.read()
            except OSError as e:
                print("FAIL %s: unreadable (%s)" % (path, e))
                bad += 1
                continue
            m = FM_RE.match(text)
            if not m:
                print("FAIL %s: no frontmatter block" % path)
                bad += 1
                continue
            try:
                fm = yaml.safe_load(m.group(1))
            except yaml.YAMLError as e:
                first = str(e).splitlines()
                print("FAIL %s: YAML error: %s" % (path, first[0] if first else e))
                bad += 1
                continue
            if not isinstance(fm, dict):
                print("FAIL %s: frontmatter is not a mapping" % path)
                bad += 1
                continue
            if fm.get("name") != name:
                print("FAIL %s: name mismatch: %r" % (path, fm.get("name")))
                bad += 1
            elif not NAME_RE.match(name) or "--" in name:
                print("FAIL %s: bad name" % path)
                bad += 1
            desc = fm.get("description", "")
            if not isinstance(desc, str) or not (1 <= len(desc) <= 1024):
                print("FAIL %s: bad description length" % path)
                bad += 1
    print("frontmatter: %d checked, %d bad" % (total, bad))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
