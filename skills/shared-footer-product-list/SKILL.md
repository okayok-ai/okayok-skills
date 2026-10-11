---
name: Shared footer and product list
description: >-
  When you want one source of truth for cross-product footer links and an "Our
  Products" list that syncs across every site in a product family.
---
# Shared footer and product list

Manage the cross-product footer and "Our Products" list in one place so editing once updates every site — no per-release hand-editing of each site.

## Design
- A small database (e.g. two tables) holds the data:
  - **products**: name (and localized name), URL, description, sort order, visible flag.
  - **footer_links**: the footer columns and their links (a Products column plus columns like Resources and Legal), with ordering.
- Public **read-only** access (row-level security allowing select only). No secrets client-side; use the public/anon read key.
- Each site fetches this data at build or runtime and renders its footer + product list from it.

## Steps
1. Create the tables in a shared project; seed them from the products/links already in each site's repo.
2. Add read-only public access.
3. Wire each site to render the footer and product list from the shared source. Keep a small in-code snapshot/backup as a fallback if the fetch fails.
4. Deploy each site; confirm the footer shows the Products column + the other columns, links resolve, and all sites match.

## Maintenance
- To add or rename a product, edit the shared data once; all sites pick it up (rebuild if they read at build time).
- Keep naming consistent with the brand convention (e.g. brand-prefixed names where agreed).

## Verify
- Every site's footer is identical and current.
- All product links open.
- A rename in the database propagates to every site.
