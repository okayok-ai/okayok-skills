---
name: Technical SEO setup
description: >-
  When setting up on-page and technical SEO for a product site: titles,
  descriptions, canonical, a single H1, robots, sitemap, structured data,
  favicon and OG.
---
# Technical SEO setup

Make a product site correctly indexable and distinct. The golden rule: **every site is independent** — its own content, titles, descriptions, and canonical URLs, never duplicating another site.

## Checklist
1. **Title & meta description.** Unique per page, product's own brand. Decide the brand convention (e.g. brand prefix in `<title>` for SEO vs short name in the header) and apply it consistently. Don't lose the brand name in the title.
2. **Canonical.** Each page points to its own canonical URL on its own host — never to the main site. Keep trailing-slash usage consistent.
3. **Exactly one H1 per page**, containing the page's core keywords and reflecting its content. Audit every key page (home, pricing, sign-in/up, category pages). Add missing H1s; fix pages with multiple H1s. For auth/app pages that shouldn't rank, set `noindex` instead.
4. **Sitemap.** Must list only the site's **own host** URLs (a common bug: a sub-site's sitemap emitting the main site's URLs — make the generator host-aware). All entries return 200, no duplicates or gaps. Localized pages are full entries.
5. **robots.txt.** Allow crawling of public pages; disallow admin/app/settings. Use `noindex` meta on pages you want crawled-but-not-indexed rather than blocking them in robots when they must be de-indexed.
6. **Structured data (JSON-LD).** WebSite and the product type (e.g. SoftwareApplication). Use the brand name; list the short name as alternateName. Keep it per-site.
7. **Favicon / OG / manifest.** Real logo at all sizes (search engines may cache old ones — replace every size and request a re-crawl). og:site_name set; OG image present; manifest name + short_name correct.
8. **llms.txt / 404** page as applicable.

## Verify live
- Fetch the real pages: each has its own title, one H1, correct canonical.
- The live sitemap contains only this host's URLs, all 200.
- Favicon/OG resolve to the new assets.

## Anti-patterns
- Shared/boilerplate titles across sites.
- A sub-site canonical or sitemap pointing at the main domain.
- Zero or multiple H1s on the landing page.

## Hand-off
Next: search-engine-submission.
