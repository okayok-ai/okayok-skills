# Growth strategy

Operate for **author replies and profile visits**. Likes, follow-for-follow volume, and posting into an empty feed do not grow the account.

Checked 2026-10-13 against public write-ups of X's For You weights and Buffer's Premium study. Vendor blogs repeat these numbers and then sell reply bots or follower packages — ignore the product pitch. Do not buy followers or engagement.

## What the ranker actually pays for

X's For You factors, as published via its ranking overview (Social Media Today, 2025-09-09):

| Signal | Weight |
| --- | --- |
| You reply, and the author engages with that reply | +75 |
| You reply | +13.5 |
| You open the author's profile and like or reply | +12 |
| You open the conversation and like or reply | +11 |
| You stay in the conversation ≥2 minutes | +10 |
| Repost | +1 |
| Like | +0.5 |

A reply the author answers is about **150× a like** (+75 / +0.5). That is the growth engine.

Penalties called out in the same overview: links in the post, all caps, "offensive" text, negative feedback (show less / mute / block / report), and repeatedly mentioning the same @handle. Penalties stack into the account's reputation, so one spammy week keeps suppressing later posts.

X has said this heuristic code is moving toward Grok-style ranking. Practical effect already visible: a specific post for a narrow reader can travel without a large follower count. Hashtag stuffing does not.

Source: https://www.socialmediatoday.com/news/x-formerly-twitter-open-source-algorithm-ranking-factors/759702/

## The loop

1. **Scout** posts from the last few hours, in-niche, where the author is still answering people. Mid-size accounts (roughly 5–50× this account) reply more often than huge ones. Skip a post if you cannot add a concrete point.
2. **Reply** so the author can answer: one specific detail, a real disagreement, or a question only they can answer. No link. See [replying.md](replying.md).
3. **If they answer, answer once.** That second turn is the +75 signal. Then stop.
4. **Convert the profile visit.** Bio says who you help. Pinned post is the best artifact, not "welcome". One link, in the bio or pinned post.
5. **Your own post** gets the same treatment: the first hour, answer every comment with a real sentence (not "thanks"). See [posting.md](posting.md).
6. **Weekly:** keep formats that earned an author reply or a follow. Drop formats that only got likes.

Stay inside [safety.md](safety.md). A smaller number of specific replies beats filling the daily cap with templates.

## Stage shift

| Stage | Do this | Stop doing this |
| --- | --- | --- |
| Beginner | 互关 to move the follower count, plus specific replies under larger posts | Template replies ("来了来了", "互关啊"); follow bursts that trip a rate limit |
| Mid | Same replies, aimed at bigger accounts; test one longer post or a native short video each week; 3–5 niche Communities, value only for ~2 weeks before any product mention | A thread every day; links in the main post |
| Late | Repurpose posts that already earned conversation; collaborations | Buying reach or followers |

On a beginner account right now, **互关 is how the follower count actually moves.** One account's own analytics (Oct 2026): followers went from 81 to 179 in two days after following about 70 people in the same circle, with a high follow-back rate. Over 3 months the account had ~3K impressions, 86 profile visits, and 0 reposts — almost all of that was the last 7 days (2.8K impressions, 84 profile visits). 182 of 190 followers were verified and 187 had been active in 24 hours. People followed back without reading the profile.

That count is not a reader base. The 互关 posts themselves got 11–48 impressions and usually 0 likes. Empty replies ("来了来了", "互关啊") got 1–2 impressions. A specific opinion under a larger account's hot post looked like 5–10× the impressions at first, but a later A/B test (104 replies, hot vs normal) showed median likes of about 6 vs 7 and means of 13.6 vs 12.6 — no reliable lift. Don't overclaim it. The best original post was a concrete product intro (218 impressions, 8 likes, 4 replies), still with no reposts.

So for 0–1k: use 互关 to get the first couple hundred live accounts, inside the follow cap, only people who actually post. Spend replies on people who are 出摊 right now. Do not expect those followers to distribute product posts. A wild same-day follow/unfollow churn is still a penalty — this is not that.

**Hundreds of replies:** that part is real, and it is mostly not essays. On 2026-10-13 a account that joined the same month already had about 3,200 followers and 2,700 following; in a 5.6-hour slice it posted 319 replies, 98% of them under 40 characters ("握握手", "确实", "再次恭喜你"). Pace was about one a minute. Another account's replies in the same circle were the same sentence, "先浇，被cd中" — 159 of them in 2.2 hours — which is what a cooldown looks like. A third account had about 5,000 posts and only 350 followers, and had already posted that hundreds of replies a day brought almost no visitors. Volume moves the count only while each reply lands on a live 出摊 account. Claims of 2,000–3,300 replies a day are what people type; the timelines that were counted were a few hundred across the hours they were actually online. Faster than about one a minute is the pattern that already rate-limited a beginner account (see [lessons-learned.md](lessons-learned.md)).

## Premium

Buffer's study of 18.8M posts from 71k accounts (Aug 2024–Aug 2025): median impressions per post were under 100 on free accounts, about 600 on Premium, and over 1,550 on Premium+. By March 2025 the median engagement rate on free accounts was 0% (at least half of posts got no likes, replies, or reposts). Text and native video beat images; **link posts were the worst**, and on free accounts their median engagement flatlined.

Premium multiplies a post that already earns conversation. It does not rescue generic posts. The owner decides whether to pay; do not subscribe for them. Prices change — don't hardcode them.

Source: https://buffer.com/resources/x-premium-review/

## Hot posts vs normal posts

Spend a bit over half of replies on recent hot posts (last few hours) from larger same-field accounts — they reach people outside your mutual graph. The rest go to normal live posts, which convert to follow-backs just as well. Tag every reply A (hot) / B (normal) in the log and compare likes and follower conversion after ≥10 each and 24 h. Measured Oct 2026: no clear lift for hot posts (median ~6 vs ~7 likes). Report what your own data says; never quote a multiplier you have not measured.

## Language and time zones (bilingual accounts)

Reply in the language of the post, and write natively — never translate a Chinese reply into English or back.

- **Asia daytime (≈09:00–21:00 Shanghai)**: Chinese circle. 互关 / 蓝V互关 / 出摊 culture: short warm replies, follow back live same-field accounts.
- **Asia night (≈21:00–09:00 Shanghai, US daytime)**: English circle — AI, indie hackers, build in public, SaaS. "Let's connect" threads are the English 互关: the poster tags @X, lists identities (founder, AI, SaaS, indie hacker) and asks people to say what they build. Reply with one line on what you build plus a specific compliment, or ask what they are building.
- Track Chinese and English results separately (replies, likes, follow-backs per batch); conversion across languages can be lower.
- Trend check with X Radar (Premium+), Oct 2026: "let's connect" ~35–40k posts/day, up ~18% in a week; 互关/回关/浇友 (min_faves:5) roughly doubled in a week. Re-check before relying on it.

Original posts: Chinese reaches Chinese-speaking readers; English reaches the builder / indie cluster. Match the audience for that slot (see [posting.md](posting.md)).
