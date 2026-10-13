# Lessons learned

## 2026-10-13 — public growth write-ups vs this skill
- **What we checked**: X's published For You weights (a reply the author engages is +75, a like is +0.5) and Buffer's Premium study (18.8M posts, Aug 2024–Aug 2025: free accounts under ~100 median impressions, Premium ~600, Premium+ over ~1,550; link posts worst). Chinese how-to posts mostly resold those numbers, and one Zhihu piece ended by selling followers.
- **What changed in this skill**: replies that can earn an author answer are what gets impressions; no links in the main post; answer your own comments in the first hour; Premium is the owner's call, not a substitute for conversation.
- **Corrected the same day from one beginner account's analytics**: 互关 is what moved followers (81 → 179 in two days, ~70 follows, high follow-back). Those followers are live verified accounts, not readers — 3-month profile visits were 86, reposts 0, and the 互关 posts themselves got 11–48 impressions. Empty 互关 replies got 1–2 impressions. A specific reply under a larger hot post seemed to get 5–10× that; the A/B test below retracted that claim.
- **What we did not adopt**: TweepCred cutoffs, "repost is 20× a like", and any follower-package or reply-bot pitch. Those conflict with the ranking overview or with [safety.md](safety.md).

## 100 actions at 10 s spacing → rate-limited after ~15 follows
- **What happened**: an account tried ~100 reply+follow actions in one evening at ~10 s intervals, with two scripts running at the same time. After ~15 follows X showed "You are rate limited" (你受到速度限制). The replies the scripts logged as "sent" never actually appeared on the account.
- **Lessons**:
  - Fixed short intervals look like a bot; use random 60–180 s and small batches.
  - Run **one script/session at a time**.
  - **Verify each reply is visible** before counting it; a script's success log is not proof.
  - After a rate limit, do not empty the rest of the day into one retry. Probe with one action (15 min, then 30, then 60) and write the result in the log below.

## Rate-limit probe log

One row per test. This is how the recovery time gets measured. Do not skip a failed test.

| Time (Shanghai) | Action | Result | Next wait |
| --- | --- | --- | --- |
| | | | |

## 2026-10-14 — high-volume praise batches
- **A/B (hot vs normal posts)**: 104 historical replies, median likes ~6 (hot) vs ~7 (normal), means 13.6 vs 12.6. The "5–10×" claim was retracted.
- **Reply tone**: a reply that mentioned the account's own falling reach read as a complaint; switched to short, specific praise of the author. No growth jargon in replies.
- **Test post leak**: a script test posted "test" under a real post. Test only on your own posts.
- **Script bugs**: a missing env var sent the browser to `https://x.comundefined/`; hard-code or validate URLs before navigating. A hung browser bridge silently stalls batches — use the anti-stuck rules in [automation.md](automation.md).
- **Bilingual schedule**: Chinese circle by Asia day, English "let's connect" circle at Asia night; written natively in each language.
