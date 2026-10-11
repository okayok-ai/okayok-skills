---
name: Domain and deploy
description: >-
  When wiring a product site to a domain or subdomain, setting up DNS, hosting,
  CI/CD, tag-based production releases, and deployment tokens.
---
# Domain and deploy

Get a product site onto a real URL with DNS, hosting, and a repeatable release pipeline.

## Domain
- A **subdomain of your brand domain** (e.g. `product.brand.tld`) is a free, fast launch path — same as siblings. Buy a dedicated domain only when there's a real reason.
- In your DNS provider, add the record the host asks for (typically a CNAME to the host's target). Set proxy/CDN status as the host requires (often DNS-only for verification records).

## Hosting & project
- Create the hosting project, connect the repo, set the production domain.
- Put all secrets in the host's environment/secret store, scoped to production. Never commit secrets or paste them in chat.

## CI/CD & releases
- **Production ships only on version tags** (e.g. `v*` or a product-prefixed tag), not on every push. Non-tag pushes can preview but not go live.
- Release flow: commit + push the default branch, then create an annotated version tag and push the tag.
- **Never force-push, never skip hooks** (`--no-verify`) on shared branches. Push only to the intended remote.
- Add post-deploy automation here if used (e.g. an IndexNow ping — see search-engine-submission).

## Tokens
- Use one well-scoped deploy token per org/team, stored as a CI secret (and optionally the OS keychain). Avoid a sprawl of duplicate tokens; delete old ones.
- Setting an org-level secret may need elevated permissions on your code host; grant the scope, then set it.

## Verify live
- The production URL resolves over HTTPS with a valid cert.
- The tag-triggered deploy succeeded and the live site shows the new build.
- No stale preview/host URLs linger in content.

## Hand-off
Next: technical-seo and search-engine-submission.
