---
layout: post
title:  "Wait Wait Stats Updates: November 2025"
date:   2025-11-01 14:45:00 -0800
tags:   stats waitwait update
---

The [Wait Wait... Don't Tell Me!](https://waitwait.npr.org/) that aired on [November 1, 2025](https://stats.wwdt.me/shows/2025/11/1) was the very first show that had a panel consisting of three men: Adam Burke, Alonzo Bodden and Josh Gondelman. This happened a little over 10 years since the very first show with an all women panel that aired on [September 12, 2025](https://stats.wwdt.me/shows/2025/9/12) with Faith Salie, Paula Poundstone and Roxanne Roberts.

After entering the panelists for this week's into the Wait Wait Stats Database, I noticed that the "Panel Gender Mix" report and graphs were not picking up on the all men panel. Looking at the code behind both, I noticed a gap in the code's logic where shows with an all men panel would never get counted.

I just finished publishing updates to both the [Wait Wait Graphs Site](https://graphs.wwdt.me/) and the [Wait Wait Reports Site](https://reports.wwdt.me/) that includes the required code fix.

In addition to the fixes, I also created a new "[All Men Panel](https://reports.wwdt.me/shows/all-men-panel)" report to complement the existing "[All Women Panel](https://reports.wwdt.me/shows/all-women-panel)" report to mark the occasion.

As always, release Notes for the new versions of the Graphs and Reports Sites can be found on GitHub:

* graphs.wwdt.me [v3.7.1 Release Notes](https://github.com/questionlp/graphs.wwdt.me/releases/tag/v3.7.1)
* reports.wwdt.me [v4.7.0 Release Notes](https://github.com/questionlp/reports.wwdt.me/releases/tag/v4.7.0)
