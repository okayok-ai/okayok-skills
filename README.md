# Okayok Skills

Open-source, reusable **skills** for AI agents – step-by-step playbooks written in the `SKILL.md` format that an agent (or a human) can follow to get a recurring job done reliably.

Each skill captures a workflow that worked in practice, stripped of anything personal, so you can drop it into your own agent setup and adapt it.

## Skills

| Skill | What it does |
| --- | --- |
| [`x-growth`](skills/x-growth/SKILL.md) | Grow a Twitter/X account through genuine engagement: scout targets, draft value-first replies for approval, follow at a safe pace, build-in-public posting, and a daily cadence. |

## Format

Every skill lives in its own folder under `skills/`:

```
skills/
  <skill-name>/
    SKILL.md        # required: the playbook
    ...             # optional: templates, examples, scripts
```

`SKILL.md` starts with YAML frontmatter, followed by a Markdown body:

```markdown
---
name: skill-name
description: One line saying when an agent should use this skill.
---

# Title

Steps, rules, templates...
```

- `name` – short, kebab-case, matches the folder name.
- `description` – one sentence describing **when** to use the skill; agents use it to decide whether the skill applies.

## How to use

- **With an agent that supports skills**: copy (or symlink) a skill folder into your agent's skills directory. The agent reads the frontmatter to know when to load it.
- **With any agent**: paste the contents of `SKILL.md` into the system prompt or task instructions.
- **As a human**: just read it – they're written as plain checklists.

Skills are starting points. Fill in the placeholders (`<Product>`, `<URL>`, ...) with your own details and tune volumes, tone, and rules to your situation.

## Principles

- **Human in the loop** for anything public or irreversible (posting, messaging, following, spending).
- **No private data** – skills contain no personal names, accounts, emails, paths, or keys.
- **Practical over theoretical** – every step should be something you can actually do.

## Contributing

Improvements and new skills are welcome.

1. Fork the repo and create a branch.
2. Add or edit `skills/<skill-name>/SKILL.md` following the format above.
3. Keep it generic: use placeholders instead of real accounts, products, or personal details.
4. Open a pull request describing what the skill does and what you changed.

## License

[MIT](LICENSE) © 2026 Okayok
