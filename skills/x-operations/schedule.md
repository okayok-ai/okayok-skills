# Daily schedule

Asia/Shanghai. A scheduled run drafts and waits. Nothing goes out until the owner approves that batch.

## What each action is for

Measured on a beginner account and on the 蓝V circle, 2026-10-13. Ranker weights are X's published For You factors (a like is +0.5, a reply is +13.5, the author answering you is +75).

Caps below are ceilings, not a quota to fill. These are the running rules for a follow-back account.

| Action | Use it for | Cap | Skip it when |
| --- | --- | --- | --- |
| Reply | Follow-backs, and the only thing that gets you seen | 20 in any rolling hour, 250/day, 45–120 s apart, ≤8 per batch | This account already got a reply today (except people who replied to you), or this thread was already replied to |
| Follow-back | Someone who just followed this account | 80/day, ≤3 per batch, ≥30 s apart | They do not follow this account |
| Proactive follow | Someone just replied to, who posts a connect / follow-back line and does not follow this account yet | 80/day, ≤3 per batch, ≥30 s apart, counted separately from follow-backs | The account has no posts, or this account already follows them |
| Own post | One concrete piece a day | 1 | It is an 出摊 template, or it contains a URL |
| Like | The post just replied to, plus 3–5 extra likes in that batch | 300/day, ≤12 per batch, ≥15 s apart | Liking down a timeline |
| Reply to people who replied to you | They already saw this account | ≤5 per batch, in their language | Product questions and growth-method questions: skip them, and do not put them in the receipt |
| Repost, bookmark, quote | Not a growth lever here. 出摊 posts get about 0 reposts | 0 | Always |

Likes barely move the ranker. A like-only session does not grow the account. Reposting other people's 出摊 lines looks like a pod.

## Which posts to reply under

In this order:

1. **Live 出摊, last 1 hour.** Author is still answering. Already 10–80 replies, not a dead template and not a pile so big you are comment 400. This is the follow-back engine. One short line that could only be said to this post (a concrete detail from that post). Not "来了来了", not "互关啊", not "先浇".
2. **Skip growth-method and product questions** (是否值得互关, how to get followers, product support). Do not reply and do not put them in the receipt. Radar showed those threads get a lot of replies; they are still a skip.
3. **Builder posts that already travel.** Radar query `(独立开发 OR 出海 OR buildinpublic) min_faves:20`. Prefer posts with at least one repost. One sentence about something you actually shipped. This is how you get seen outside the mutual graph. Your product intro did 218 impressions; 出摊 lines did 11–48.

Skip: accounts whose recent replies are all the same sentence ("先浇，被cd中" — that account is already cooling down), empty profiles, follow-farms, anything sexual, politics, tragedies. Also skip the hundredth copy of "蓝V，活的，来交朋友" when it has almost no replies yet. The copies that work already have a crowd in the thread.

## Which accounts

- Still posting today. About 300–5,000 followers. They follow back. Bigger accounts only if the post is under 30 minutes old.
- Follow them after the reply, in the same session, inside the proactive-follow cap.
- Unfollow only after the owner confirms that list. Never unfollow on the same day you followed.

## Clock

Act like a person who checks the app through the day, not like a shift that dumps 40 actions at lunch and 40 at night.

- Language clock (Asia/Shanghai): **09:00–21:00** use the daytime circle's language; **21:00–09:00** use English. People who replied to you get their own language at any hour. Batches continue overnight.
- One batch about every 20 minutes, one source per batch. Shared ceilings: 20 replies in any rolling hour, 250/day.
- Gap between replies: **45–120 s**, random. Likes **≥15 s**. Follows **≥30 s**.
- Lanes may browse at the same time. Sends share one timestamp lock and the hourly cap, so they stay serial. Two scripts that do not share that lock are how this kind of account gets limited.
- The one original post goes out once, sometime **19:00–21:30**, as its own small action, not in the middle of a reply pile. Answer comments on it when you next pass through, within the first hour if you are still around.
- Daytime batches lean on live 出摊 posts. Night batches use the English builder circle.

## When the page warns

A limit, a lock, or an unusual-activity notice on the X page writes the stop file (now + 24 h) and stops every lane. Do not send a probe while that file is active. After it expires, run at half the caps above until the next clean day.

A single "Something went wrong" / "出错了，再试一次" is not that warning. Open the account's Replies tab first. If the reply is already there, do not write the stop file. Two send attempts in a row with the reply absent still write the stop file.

| Signal | Response |
| --- | --- |
| Rate limit, lock, unusual activity | Write the stop file for 24 h. Half caps after it expires, until the next clean day |
| One "something went wrong" / try-again toast | Check the Replies tab. Already posted → no stop file. Two misses in a row → stop file |
| Replies folded ("show more") | Browse only for 2–5 days, then half-size batches |
| Phone or CAPTCHA | Complete it, rest 48 h, then half caps |
| Locked or suspended | Appeal via X Help. No actions until it is back. |

## What the timed run produces

Each tick is one batch on the 20-minute cadence. Confirm the account, read follower and following counts, then draft inside the caps above. Wait for approval before sending. If the stop file is active, do nothing. If a hard warning is on screen, write the stop file and do not draft a batch.
