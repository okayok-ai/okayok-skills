---
name: Scaffold or migrate a site from a shared template
description: >-
  When standing up a new product marketing/site from a shared template, or
  migrating an existing site onto that unified template, including rebranding
  all names and copy.
---
# Scaffold or migrate a site from a shared template

Stand up a new product site from your shared template, or move an existing site onto it, so every product site shares one look, stack, and conventions while staying independent in content.

## When to use
- New product needs a marketing/landing site.
- An old site (different stack or one-off design) should be unified onto the shared template.

## Steps
1. **Copy the template** into a new project folder. Keep the shared structure; don't fork the design.
2. **Rebrand everything** from the template/source brand to the new product: names, copy, file names, directory names, page titles, metadata, README, config. Grep the whole tree for the old brand strings and replace them. Keep the project runnable after each change.
3. **Keep only what carries over from an old site** when migrating: the real feature copy, screenshots, download links, pricing — not the old design or stale/misleading claims. Don't copy benchmarks or features the product doesn't actually have.
4. **Independent content.** Give the site its own titles, descriptions, H1, and canonical URLs. Never leave it duplicating the main site or a sibling site — duplicate content blocks indexing.
5. **Brand rules.** Apply the agreed convention (e.g. short name in the header; brand prefix in titles, structured data, og:site_name, and footer for SEO). Set the site name in code rather than relying only on a template env var that may still hold the old name.
6. **Assets.** Replace favicon, logo, OG image, app manifest name/short-name, and the small on-page brand labels.
7. **Legal pages.** Give the product its own privacy policy and terms; set the real contact email. Don't ship another product's legal text.
8. **Run it locally** and confirm it builds and renders before moving on to deploy.

## Verify
- No occurrences of the old brand remain (grep).
- Title, H1, canonical, and OG are the product's own.
- The site runs locally with no template leftovers.

## Hand-off
Next: domain-and-deploy, then technical-seo.
