---
layout: post
title:  "Wait Wait Stats Updates: October 2025 Part Two"
date:   2025-10-15 22:05:00 -0700
tags:   stats waitwait update
---

Although it has only been about a week since the last [Wait Wait Stats Update]({{ site.url }}{% post_url 2025-10-10-wait-wait-stats-update-october-2025 %}) blog post, there have been a couple of updates to the project and to the production instances of the Wait Wait Stats sites.

### Wait Wait Stats: Python 3.12 and Beyond

In the previous update, I published a new version of the [Wait Wait Stats Library](https://github.com/questionlp/wwdtm) where minimum supported version of Python was moved from 3.10 to 3.12. Included with those chances were updating a number of the dependencies and also adding provisional support for MariaDB Server 11.8 and 12.

The Stats Library is used by the [Wait Wait Stats Page](https://stats.wwdt.me/), [Wait Wait Stats API](https://api.wwdt.me/) and the [Wait Wait Graphs Site](https://graphs.wwdt.me/) as a foundation to retrieve basic information and detailed data for Not My Job guests, hosts, locations, panelists, scorekeepers and shows.

Each of the web applications have been updated to use the new version of the Stats Library and now require Python 3.12 or newer.

I had already been running the applications using Python 3.12 in production for quite a while now and had also been testing the applications using Python 3.13 and against copies of the Wait Wait Stats Database on servers running MySQL Server 8.4 and MariaDB Server 12. After a barrage of testing, I felt like it was time to switch over to running the applications using Python 3.13 in production. This includes the [Wait Wait Reports Site](https://reports.wwdt.me/), which received a small update to use the same dependency versions as the Stats Library and other sites.

Testing the Stats Library and all of the applications using Python 3.14 is something that I'll start in the coming months.

### Panelist Scoring Exceptions and Anomalies

Along with getting all of the Wait Wait Stats Project web applications updated, I updated the Wait Wait Stats Library to include a `score_exception` flag for each panelist appearance dictionary returned. The calculation is based on if there is a mismatch between a panelist's total score as stated by the judge and scorekeeper and how total scores should be calculated:

> **Total Score** (**Lightning Fill In The Blank Starting Score** / **Correct Answers**)

A mismatch can happen with bonus points that are given during the equivalent to Lightning Fill In The Blank for shows from 1998, or it can happen when there is a miscount or miscalculation of the score. Although I had been noting those exceptions and anomalies in the notes for each show that it happens, there was no way to specifically get that flagged until now.

By default, the `score_exception` flag is set to `False`, unless if the code determines a mismatch and then sets it to `True`. This is similar to the `score_exception` flag that already exists for Not My Job guest appearances, though that is handled by a corresponding column in the `ww_showguestmap` table, since how a Not My Job scoring exception is determined is not based on any calculations.

The new flag is available in [version 2.21.1 of the Stats Library](https://github.com/questionlp/wwdtm/releases/tag/v2.21.1) and the new version of the library is now being used by the Graphs Site, Stats API and the Stats Page.

For the [Wait Wait Stats Page](https://stats.wwdt.me/), the panelist scoring exception is noted by an asterisk in the same way a Not My Job guest scoring exception is noted. In both cases, hovering over the asterisk will make a little note pop-up stating that the asterisk represents a scoring exception.

Since the [Wait Wait Stats API](https://api.wwdt.me/) returns a JSON representation of the resulting dictionary or list that is returned by the Stats Library, the new `score_exception` flag is included with panelist appearance objects returned by panelists and show detail endpoints.

For the [Wait Wait Reports Site](https://reports.wwdt.me/), I added a new panelists [Scoring Exceptions and Anomalies](https://reports.wwdt.me/panelists/scoring-exceptions) report that returns a list of each exception or anomaly, including the show date, the panelist's Lightning Fill In The Blank starting score, number of correct answers, recorded total score, the panelist's ranking for the show, and show notes to provide additional context.

### Odds and Ends

The [Wait Wait Stats Project Theme](https://github.com/questionlp/wwdtm-theme) received a minor update to fix an issue where the DB ID and the panelist ranking badge background color was the same as the page's background color when using the dark color theme.

The [Wait Wait Graphs Site](https://graphs.wwdt.me/) also saw a minor update to change the background color for the charts to match the page's background color when using the dark color theme.

Most of the active repositories for the Wait Wait Stats Project have been updated to adopt the [Contributor Covenant 3.0 Code of Conduct](https://www.contributor-covenant.org/version/3/0/code_of_conduct/) from the previous version 2.1.

In addition to adopting the new Code of Conduct, verbiage has been added to both the README and CONTRIBUTING files to state that the project **does not** accept pull requests or bugfixes that include code that has been partially or wholly generated using AI.
