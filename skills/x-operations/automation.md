# Automation reliability

For owners who run approved reply batches on a schedule (browser automation is against X's rules for unattended use — keep the owner in the loop and stay conservative, see [safety.md](safety.md)).

## Guards
- **Lock file** (e.g. `~/x-batch.lock` with a timestamp): skip a run if a lock younger than ~30 min exists; remove stale locks. Only one session at a time.
- **Stop-until file** (e.g. `~/x-stop-until`): on any warning, rate limit, verification prompt, or "you are rate limited", write now + 24 h and stop. Every run checks it first.
- Never log in on the owner's behalf. Logged out or wrong account → stop and report.

## Pacing
- Random **20–60 s** between replies inside a batch at minimum (60–180 s on young or recently limited accounts). No fixed intervals, no bursts.
- Batches of ~6–15 replies plus a few follow-backs, with gaps between batches.
- Don't maximise volume. Track follower delta and follow-back rate every few hours and per batch; raise volume only while conversion holds, lower it when it drops or warnings appear.

## Anti-stuck rules
- A post fails twice (box won't open, send disabled, page error) → skip it.
- No successful action for **15 min** → end the batch and report.
- If the browser bridge hangs even on a trivial command, stop and ask the owner to restart the browser rather than killing processes blindly.
- Verify each reply on the account's Replies tab before counting it.

## Logs and receipts
- Append one line per reply: `date time handle postId replyUrl AB=A|B lang=zh|en`. Use it to enforce one reply per account per day and no repeat threads.
- Log follows separately (date, handle) for the 7-day unfollow cleanup.
- After every batch send the owner a receipt: replies sent (with handles), follow-backs, warnings, follower/following counts.
- Summarise conversion (A vs B, zh vs en) every ~6 hours and daily.
