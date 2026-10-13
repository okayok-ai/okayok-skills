# Okayok Skills

English | [简体中文](README.zh-CN.md)

Open-source, reusable **skills** for AI agents – step-by-step playbooks written in the `SKILL.md` format that an agent (or a human) can follow to get a recurring job done reliably.

Each skill captures a workflow that worked in practice, stripped of anything personal, so you can drop it into your own agent setup and adapt it.

## Skills

**New here? Start with [`product-lifecycle-overview`](skills/product-lifecycle-overview/) — it's the map that ties all the other skills together in order** (naming → site → deploy → SEO → submission → analytics → release → growth).

| Skill | When to use it |
| --- | --- |
| [Product lifecycle overview](skills/product-lifecycle-overview/) | Launching or migrating a software product end-to-end and you want the big-picture sequence that ties the individual skills together. **Start here.** |
| [Brand naming](skills/brand-naming/) | Naming a new software product or brand: check candidates for conflicts and pick a name that is brandable and good for SEO. |
| [Scaffold or migrate a site from a shared template](skills/scaffold-or-migrate-site/) | Standing up a new product site from a shared template, or migrating an existing site onto it, including rebranding all names and copy. |
| [Domain and deploy](skills/domain-and-deploy/) | Wiring a product site to a domain or subdomain: DNS, hosting, CI/CD, tag-based production releases, and deployment tokens. |
| [Technical SEO setup](skills/technical-seo/) | On-page and technical SEO for a product site: titles, descriptions, canonical, a single H1, robots, sitemap, structured data, favicon and OG. |
| [Search engine submission](skills/search-engine-submission/) | Verifying a site in Google Search Console and Bing Webmaster Tools, submitting sitemaps, and setting up IndexNow. |
| [Web analytics setup](skills/web-analytics/) | Adding GA4 data streams and a session-analytics tool to a product site, unified under one property, and verifying they fire live. |
| [Desktop app release](skills/desktop-app-release/) | Releasing a macOS (or cross-platform) desktop app: icon, code signing and notarization, GitHub Releases, auto-update, and faster signing. |
| [Shared footer and product list](skills/shared-footer-product-list/) | One source of truth for cross-product footer links and an "Our Products" list that syncs across every site in a product family. |
| [Operations and growth](skills/operations-growth/) | Ongoing operations and growth: audience channels, an account matrix, posting cadence, and community engagement to drive exposure. |
| [X operations](skills/x-operations/) | Running and growing an X/Twitter account across stages: replies that earn an author response, a daily loop with owner approval, posting cadence, and anti-ban safety limits. |

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
