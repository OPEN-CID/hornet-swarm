# Security Policy

## Report privately

Do not open public issues for live secrets or vulnerabilities. Use
GitHub **Security Advisories** (Report a vulnerability) on this repo.

## Rules for contributors

- **Never commit secrets**: tokens, passwords, private keys, customer data,
  or real patient/client documents — not in skills, examples, tests, or images.
- Parse-type skills must use placeholders (`<token>`, `patient X`) in examples.
- If you leak something: rotate/revoke it immediately, then tell us so we can
  purge history.
- Skills give defensive guidance only. No exploit payloads, no bypasses for
  safety controls, no instructions that facilitate wrongdoing.

## Scope notes

- Medical/legal/finance skills are informational and must keep their
  disclaimers (enforced by convention, reviewed by humans).
- We will not accept skills designed to deceive, phish, or evade detection.
