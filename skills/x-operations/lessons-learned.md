# Lessons learned

## 100 actions at 10 s spacing → rate-limited after ~15 follows
- **What happened**: an account tried ~100 reply+follow actions in one evening at ~10 s intervals, with two scripts running at the same time. After ~15 follows X showed "You are rate limited" (你受到速度限制). The replies the scripts logged as "sent" never actually appeared on the account.
- **Lessons**:
  - Fixed short intervals look like a bot; use random 60–180 s and small batches.
  - Run **one script/session at a time**.
  - **Verify each reply is visible** before counting it; a script's success log is not proof.
  - After a rate limit, stop for 24 h and ramp back up.
