# Daily schedule

Asia/Shanghai. A scheduled run drafts and waits. Nothing goes out until the owner approves that batch.

## What each action is for

Measured on a beginner account and on the 蓝V circle, 2026-10-13. Ranker weights are X's published For You factors (a like is +0.5, a reply is +13.5, the author answering you is +75).

| Action | Use it for | Daily cap (clean day) | Skip it when |
| --- | --- | --- | --- |
| Reply | Follow-backs, and the only thing that gets you seen | 80, spread through the day in passes of 6–10 | The line is one you already used today |
| Follow | Turns a reply into a follow-back | 30, only people you just replied to | The account has no posts, or you followed them today |
| Own post | One concrete piece a day | 1 | It is an 出摊 template, or it contains a URL |
| Like | A single like on a post you are replying to | 1 per reply, no like-only pass | You are liking down a timeline |
| Reply to your own comments | Keeps your post in the conversation | Every comment in the first hour | The reply would be "thanks" |
| Repost, bookmark, quote | Not a growth lever here. 出摊 posts get about 0 reposts | 0 | Always, until a post of yours actually earns a repost |

Likes barely move the ranker. A like-only session does not grow the account. Reposting other people's 出摊 lines looks like a pod.

## Which posts to reply under

In this order:

1. **Live 出摊, last 2 hours.** Author is still answering. Already 10–80 replies, not a dead template and not a pile so big you are comment 400. This is the follow-back engine. One short line that could only be said to this post (a detail, a real answer to their question). Not "来了来了", not "互关啊", not "先浇".
2. **Questions in that circle** about 限流, 曝光, or how they follow back. Those posts were the ones with the most replies in Radar (one hit 168 replies / 2,785 views). Answer the question.
3. **Builder posts that already travel.** Radar query `(独立开发 OR 出海 OR buildinpublic) min_faves:20`. Prefer posts with at least one repost. One sentence about something you actually shipped. This is how you get seen outside the mutual graph. Your product intro did 218 impressions; 出摊 lines did 11–48.

Skip: accounts whose recent replies are all the same sentence ("先浇，被cd中" — that account is already cooling down), empty profiles, follow-farms, anything sexual, politics, tragedies. Also skip the hundredth copy of "蓝V，活的，来交朋友" when it has almost no replies yet. The copies that work already have a crowd in the thread.

## Which accounts

- Still posting today. About 300–5,000 followers. They follow back. Bigger accounts only if the post is under 30 minutes old.
- Follow them after the reply, in the same session, inside the follow cap.
- After 7 days, unfollow people who did not follow back. ≤30 that day, and never on the same day you followed them.

## Clock

Act like a person who checks the app through the day, not like a shift that dumps 40 actions at lunch and 40 at night.

- Window: **09:00–23:30**. Outside it, do nothing.
- A pass is **6–10 actions** (replies, plus a follow only for someone just replied to). Then leave.
- Gap between passes: **45–90 minutes**, picked at random, not the same gap every time. Inside a pass, still **60–180 s** between actions.
- After a reply is sent, wait about 10 seconds before the next post. Do not chain posts with no gap, and do not sit on one post for a minute.
- About **8–10 passes** gets to the daily cap. Some passes are shorter. Skip a pass some days.
- The one original post goes out once, sometime **19:00–21:30**, as its own small action, not in the middle of a 40-reply pile. Answer comments on it when you next pass through, within the first hour if you are still around.
- Mix the targets as the day moves: daytime passes lean on live 出摊 and questions; evening passes add builder / English posts. Do not save every builder reply for 21:30.

## When rate-limited

A soft limit (follow fails, "rate limited", replies say you are on cooldown) is a pause and a measurement, not a 24-hour shutdown. A lock, a suspension, or a phone/CAPTCHA check is different and still stops the account.

1. Stop the current pass. Do not start a second session.
2. Wait **15 minutes**. Send **one** test action: a single reply on a live post, or a single follow if the failure was a follow.
3. Record a row: time, action, exact warning text, whether it showed up on the Replies tab.
4. If it failed, the next test waits **30 minutes**, then **60**. Do not go back to 15 minutes until one test sticks.
5. If it showed up, wait a random **20–40 minutes** and test one more. After **3 successes in a row**, resume passes of 6, not a catch-up pile.
6. Two sent replies in a row missing from the Replies tab count as a failed test.

The owner has allowed this single probe to go out without a fresh batch approval. Anything beyond that one action still waits for approval.

| Signal | Response |
| --- | --- |
| Soft rate limit / cooldown | Probe as above, and keep the log |
| Replies folded ("show more") | Browse only for 2–5 days, then passes of 6 |
| Phone or CAPTCHA | Complete it, rest 48 h, then passes of 6 |
| Locked or suspended | Appeal via X Help. No actions until it is back. |

## What the timed run produces

Each tick is one pass, 45–90 minutes after the last, inside 09:00–23:30. Confirm the account, read follower and following counts, then draft 6–10 actions. Wait for approval before sending them. If a soft limit is already on screen, do not draft a pass — run the one-action probe and append a row to the log in [lessons-learned.md](lessons-learned.md).
