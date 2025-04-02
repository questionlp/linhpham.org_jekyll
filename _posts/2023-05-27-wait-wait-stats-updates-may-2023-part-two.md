---
layout: post
title:  "Wait Wait Stats Updates: May 2023 Part Two"
date:   2023-05-27 22:00:00 -0700
tags:   waitwait update
---

In the past couple of weeks, I have been working on a few updates to the [Wait Wait Stats Page](https://stats.wwdt.me/), [Wait Wait Reports Site](https://reports.wwdt.me/), and the [Wait Wait Graphs Site](https://graphs.wwdt.me/).

Below is a breakdown of the updates to each of the sites.

### Stats Page Updates

Version 5.3.1 of the Stats Page brings much needed revamping of how pages are rendered when using print media. Before the changes, there was a lot of wasted whitespace between elements and sections, the page footer often being printed alone on a new page, and appearance lists were rendered as a single column.

The update makes the print media rendering to be similar to how the pages are rendered on screen, including the appearance list rendering as two columns and the site title is now included at the top of the print.

For more information on the new version, check out the [release notes](https://github.com/questionlp/stats.wwdt.me/releases/tag/v5.3.1) on GitHub.

### Reports Site Updates

Versions 2.3.0 and 2.3.1 introduce two new reports, [Panelist Average Scores by Year](https://reports.wwdt.me/panelists/average-scores-by-year) and [Panelist Average Scores by Year: All](https://reports.wwdt.me/panelists/average-scores-by-year-all). The first report allows you to select a panelist to see their average score for each year that they have appeared on the show. The second report provides a grid of every panelist and year with each of their average scores by year.

Also included are fixes to typos in other panelist dropdowns, addition of tooltips for each cell in the [Panelist Appearances by Year](https://reports.wwdt.me/panelists/appearances-by-year) report, and fixing the rendering of the same report when rendered using print media.

Additional information about the changes included in both versions, check out the [releases](https://github.com/questionlp/reports.wwdt.me/releases) page on GitHub.

### Graphs Site Updates

Version 2.2.6 brings updating the [Plotly.js](https://plotly.com/javascript/) version from 2.20.0 to 2.23.1, which includes a few bugfixes and updates to the library.

For more information about the new version, check out [release notes](https://github.com/questionlp/graphs.wwdt.me/releases/tag/v2.2.6) on GitHub.

### Upcoming Plans

Although nothing is currently set in stone, but I am looking at adding new charts surrounding the average scores by year statistics that are included in version 2.3.0 and 2.3.1 of the Reports Site.

I am looking possibly generating PDF files for certain views for the Wait Wait Stats Page; though, it will not be part of the Stats Page application itself. It is still in the very early stages of design at this point.

I am also toying with the idea of creating a lightweight version of the Wait Wait Stats Page. It is something that has been on the back of my mind since the launch of version 4 and 5 of the Stats Page. The current Stats Page was designed around responsive layouts and focusing on mobile devices. That, unfortunately, has created pages that require a bit more render time than I would like for those that just want the raw information provided.

If development proceeds any of the items above, I'll provide additional updates on this site and on my Mastodon account, [@qlp@linh.social](https://linh.social/@qlp).
