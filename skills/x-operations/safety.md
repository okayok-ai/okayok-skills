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

## Community safe ranges
- Follows **30–50/day**, replies **30–40/day**.
- **Random 60–180 s** between actions (never a fixed interval).
- **15–25 actions per batch**, **2 batches/day ≥3 h apart**.
- Ramp: week 1 ~20/day → week 2 ~35 → week 3+ ~50; vary daily volume.
- Warm-up guide: https://www.shantuite.com/twitter-account-warmup-guide.html

## Automation red flags
- Duplicate or template replies.
- Engagement pods / mutual-like rings.
- Links in replies.
- Fixed-interval bursts (e.g. one action every 10 s).
- Follow-unfollow churn.
- Several scripts/sessions acting at once.

## Stop signals → response
| Signal | Response |
| --- | --- |
| Follow fails / "rate limited" | Stop all actions 24 h |
| Replies folded ("show more replies"), shadowban | 2–5 days browse only, then restart slowly |
| Phone/CAPTCHA verification | Complete it, rest 48 h, restart at half volume |
| Account locked/suspended | Appeal via X Help; no actions until resolved |

## Weekly cleanup
- Unfollow accounts that didn't follow back after **7 days**.
- **≤30–50 unfollows per session**, spaced like follows. Never unfollow the same day you followed.

## Verify, don't assume
After each reply, confirm it appears on the account's Replies tab before counting it. Log failures.
