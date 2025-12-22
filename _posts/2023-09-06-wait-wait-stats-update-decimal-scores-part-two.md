---
layout: post
title:  "Wait Wait Stats Updates: Decimal Scores Part Two"
date:   2023-09-06 20:00:00 -0700
tags:   stats waitwait update
---

While I continue to listen to the Wait Wait... Don't Tell Me! shows that aired in 1998, I ran across an episode where panelists would start the, then relatively now, Lightning Fill In The Blank segment with half-points. Since I didn't account for that when I went through updating the `wwdtm` library and all of the Wait Wait Stats-related sites, I had to go back and make additional changes.

First, I had to add two new Wait Wait Stats Database columns in the `ww_showpnlmap` table: `panelistlrndstart_decimal` and `panelistlrndcorrect_decimal.` The two columns are defined as `decimal(10, 2)` and would mirror the corresponding `panelistlrndstart` and `panelistlrndcorrect` columns. Adding the new columns rather than redefining the original columns allows for backward compatibility.

After adding the new column and creating a script to copy over values, I updated the `wwdtm` library, [Wait Wait Stats API](https://api.wwdt.me/), [Wait Wait Stats Page](https://stats.wwdt.me/), and the [Wait Wait Reports](https://reports.wwdt.me/) site to utilize the new values.

If you would like to view the release notes for the new versions of the Stats library and applications, check out the following links:

- Stats Library (`wwdtm`) v2.3.0
  - [Release Notes](https://github.com/questionlp/wwdtm/releases/tag/v2.3.0)
  - [Repository](https://github.com/questionlp/wwdtm)
  - [Read the Docs](https://docs.wwdt.me/en/v2.3.0/)
- Stats API v2.4.0
  - [Release Notes](https://github.com/questionlp/api.wwdt.me_v2/releases/tag/v2.4.0)
  - [Repository](https://github.com/questionlp/api.wwdt.me_v2)
- Stats Page v5.5.0
  - [Release Notes](https://github.com/questionlp/stats.wwdt.me/releases/tag/v5.5.0)
  - [Repository](https://github.com/questionlp/stats.wwdt.me)
- Reports Site v2.5.0
  - [Release Notes](https://github.com/questionlp/reports.wwdt.me/releases/tag/v2.5.0)
  - [Repository](https://github.com/questionlp/reports.wwdt.me)
