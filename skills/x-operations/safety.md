# Safety and anti-ban

> X's automation rules prohibit non-API, scripted browser automation of follows/replies. Keep a human in the loop, stay conservative, and accept that heavy automation can get the account permanently suspended.

## Official limits (approximate)
| Action | Limit |
| --- | --- |
| Follows | 400/day |
| Following cap | 5,000 until your follower ratio supports more |
| Posts + replies | ~2,400/day total; unverified ~50 posts / ~200 replies per day |
| Behaviour | Aggressive follow/unfollow churn is banned |

Sources: https://flottra.com/guides/x-follow-bots-and-follow-limits · https://postory.io/blog/twitter-follow-limit · https://ghostreply.agency/blog/how-many-replies-per-day-on-x

## Operating pace
The daily clock and the caps for a beginner account that wants follow-backs are in [schedule.md](schedule.md). Do not invent a higher pace in the moment.

Hard rules that sit under those caps:
- **Random 45–120 s** between replies, at least 15 s between likes, at least 30 s between follows (never a fixed interval, never ~10 s).
- Sends stay serial through one shared timestamp lock. Two scripts that do not share it already produced a rate limit, see [lessons-learned.md](lessons-learned.md).
- Official ceilings (400 follows, thousands of posts) are where accounts get banned, not a target.
- Warm-up guide: https://www.shantuite.com/twitter-account-warmup-guide.html

## Automation red flags
- Duplicate or template replies.
- Engagement pods / mutual-like rings.
- Bought followers, likes, or replies.
- Links in replies, or a URL in the main post.
- Fixed-interval bursts (e.g. one action every 10 s).
- Same-day follow-unfollow churn.
- Several unsynchronized scripts acting at once.

## Stop signals → response
| Signal | Response |
| --- | --- |
| Follow fails / "rate limited" / cooldown / unusual activity | Write the stop file for 24 h. No probe while it is active. Half caps after it expires, until the next clean day. See [schedule.md](schedule.md). |
| Replies folded ("show more replies"), shadowban | 2–5 days browse only, then restart slowly |
| Phone/CAPTCHA verification | Complete it, rest 48 h, restart at half volume |
| Account locked/suspended | Appeal via X Help; no actions until resolved |

## Follow-backs
- Follow back same-field followers who still post — a few per batch, not the whole list.
- Community warning (a 20k-view post, Oct 2026): mass follow-backs straight from the followers list are a common route to restriction; replies in comment sections are what actually grow. A beginner account was rate-limited the night follows were dense.
- Cap follow-backs at 80/day and proactive follows at 80/day, counted separately. A single follow failure that is a limit notice writes the stop file.

## Shadowban self-check
- Search `from:<Handle>` (logged out or via API) — if recent posts/replies don't show, you may be search-banned.
- Open one of your replies from another account: hidden under "show more replies" means folded.
- Run the check weekly and after any warning.

## Weekly cleanup
- List accounts that did not follow back after **7 days**, then ask the owner before unfollowing any of them.
- Space unfollows like follows. Never unfollow the same day you followed.

## Verify, don't assume
After each reply, confirm it appears on the account's Replies tab before counting it. Log failures.
