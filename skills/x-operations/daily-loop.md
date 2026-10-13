# Daily engagement loop (with approval gate)

Everything goes out under the account owner's name: **draft first, post only what the owner explicitly approves.**

## 0. Confirm inputs before starting
- **Account** – which X account acts (confirm the browser is logged in to it).
- **Products** – name, one-line pitch, URL for each product to promote.
- **Language mix** – e.g. "about half English, half <local language>".
- **Target niches** – e.g. AI tools, indie hackers / build in public, the product's category.
- **No-go rules** – accounts/topics to avoid, daily caps, tone constraints.

## 1. Scout targets (read-only)
1. Open X logged in as the account; wrong account or logged out → stop and report.
2. Record a **baseline**: followers and following counts.
3. If the account has Radar, scout there first. Two saved queries:
   - `(互关 OR 回关 OR 浇友) min_faves:5` — who is 出摊 right now. Reply and follow people who are still answering. Measured 2026-10-13: about 7,150 posts in 7 days, views mostly hundreds, replies in the dozens, reposts about 0. The blank "蓝V，活的，来交朋友" line is copied all day; a question (限流、曝光、回关) or one specific topic (AI、出海) gets more replies.
   - `(独立开发 OR 出海 OR buildinpublic) min_faves:20` — where posts actually travel. Same day: 384 posts in 7 days, and the ones that spread were concrete build notes and articles (tens of thousands of views and real reposts), not 出摊 lines.
   Otherwise search each niche on **Latest**. Prefer posts from the last few hours where the author is still answering people.
4. Build two lists:
   - **Reply targets**: post URL, author + rough size, one specific point you can add, why the author might answer. Skip if you only have a compliment.
   - **Follow targets** (beginner supplement only): a few real in-niche peers, not follow-farms.
5. Do not post, reply, like, or follow while scouting.

## 2. Draft replies → approval → post
- Write replies per [replying.md](replying.md); value first, then (only if it fits) a light honest product mention – keep links in bio/pinned post rather than replies.
- Send all drafts as one batch; wait for explicit approval (edits welcome).
- Post **exactly** the approved text, spaced per [safety.md](safety.md).
- Verify each reply appears on the Replies tab and capture its URL as a receipt.

## 3. Follow at a safe pace
- Follow only accounts from the approved list, at the pacing in [safety.md](safety.md).
- Stop immediately on any limit or spam warning; report how many succeeded.

## 4. Own posts
- Draft per [posting.md](posting.md) → owner approval → post exactly → capture URL. Use real screenshots only.

## 5. Scheduled routine
- Clock, batch sizes, and the rate-limit stop are in [schedule.md](schedule.md).
- A scheduled run **prepares** (never auto-posts): reply drafts, a follow list, one post draft → sent to the owner.
- Execute only after approval.
- Keep a log of posts replied to and accounts followed so nothing repeats across days.
- Track follower/following deltas against the baseline.
- If the computer/browser is offline or X is logged out, skip the day quietly.

## Integrity rules
- Never fabricate engagement numbers, testimonials, results, accounts, or URLs.
- Don't use sensitive topics (tragedies, politics, personal conflicts) to promote anything.
- Don't post personal information about anyone.
