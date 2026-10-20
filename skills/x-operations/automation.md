# Automation reliability

For owners who run approved reply batches on a schedule (browser automation is against X's rules for unattended use — keep the owner in the loop and stay conservative, see [safety.md](safety.md)).

## Guards
- **Lock file** (e.g. `~/x-batch.lock` with a timestamp): skip a run if a lock younger than ~30 min exists; remove stale locks. Sends share one timestamp lock, so parallel lanes stay serial. Two scripts that do not share it will trip a rate limit.
- **Stop-until file** (e.g. `~/x-stop-until`): a rate limit, lock, or unusual-activity notice writes now + 24 h and stops every lane. A single "something went wrong" / "出错了，再试一次" is checked on the Replies tab first; if the reply is already there, do not write the file. Two send failures in a row still write it. After the file expires, caps run at half until the next clean day. Every run checks the file first.
- Never log in on the owner's behalf. Logged out or wrong account → stop and report.

## Pacing
- Random **45–120 s** between replies. Likes at least **15 s** apart. Follow-backs and proactive follows at least **30 s** apart. No fixed intervals, no bursts.
- Ceilings, not targets: 20 replies in any rolling hour, 250/day; likes 300/day; follow-backs 80/day; proactive follows 80/day (counted separately).
- Don't maximise volume. Track follower delta and follow-back rate every few hours and per batch; lower volume when conversion drops or a warning appears.

## Anti-stuck rules
- A post fails twice (box won't open, send disabled, page error) → that is a consecutive send failure: write the stop file.
- No successful action for **15 min** → end the batch and report.
- If the browser bridge hangs even on a trivial command, stop and ask the owner to restart the browser rather than killing processes blindly.
- Verify each reply on the account's Replies tab before counting it. A reply that is already there does not count as a warning.

## Logs and receipts
- Append one line per reply: `date time handle postId replyUrl AB=A|B lang=zh|en`. Use it to enforce one reply per account per day and no repeat threads. Replies to people who replied to you are the exception to the once-a-day rule, not to the same-thread rule.
- Log follow-backs and proactive follows separately (date, handle). Ask the owner before any unfollow.
- After every batch send the owner a receipt: replies sent (with handles), follow-backs, proactive follows, warnings, follower/following counts.
- Summarise conversion (A vs B, zh vs en) every ~6 hours and daily.
