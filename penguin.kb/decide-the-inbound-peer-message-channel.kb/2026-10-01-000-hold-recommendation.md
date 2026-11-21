# 2026-10-01 (session 3ed32159) -- recommend hold

Agent recommendation, unruled --
set `"crossSessionInbound": "hold"` in user settings now, and move to
`refuse` once peers have a pull channel. `hold` restores the operator
act the 08-13 failure lacked: a held message reaches the model only
when an `accept` applies, and the notices keep visible what would have
arrived -- evidence on whether liveness is ever load-bearing. Leave
`SendMessage` allowed: it also carries subagent resumes.

[cross-session-messaging]: https://code.claude.com/docs/en/cross-session-messaging#control-inbound-messages
