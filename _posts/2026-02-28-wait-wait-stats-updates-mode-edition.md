---
layout: post
title:  "Wait Wait Stats Updates: Mode Edition"
date:   2026-02-28 21:45:00 -0800
tags:   stats waitwait update
---

If [Flickr can have it's MODE thing](https://blog.flickr.net/en/2026/02/26/mode-by-flickr-the-worlds-photography-festival/), I guess the Wait Wait Stats Project can also have one. Okay, maybe it's not quite as grandiose as Flickr's photography festival. After all, we're just talking statistics here.

### MODE? No, Mode

The [Wait Wait Stats Library](https://docs.wwdt.me/), the [Wait Wait Stats API](https://api.wwdt.me/), the [Wait Wait Reports Site](https://reports.wwdt.me/) and the [Wait Wait Stats Page](https://stats.wwdt.me/) have provided statistics based on panelist scoring information, such as minimums, maximums, means and medians, for a long time. With the latest update, the statistical mode for panelist scoring information has been added.

The new version of the Wait Wait Stats Library includes values for both `mode` and a `mode_multiple` in the returned panelist scoring statistics dictionary. Since there can be multiple mode values calculated from all of the panelist scores, two values are returned.

The `mode` value represents the first and lowest calculated mode value. In turn, `mode_multiple` value represents all calculated mode values, sorted from lowest to highest.

I have updated the [Wait Wait Stats API](https://api.wwdt.me/) to include both "mode" and "mode_multiple" fields in the `DecimalScoringStatistics` and `ScoringStatistics` models.

For the [Wait Wait Reports Site](https://reports.wwdt.me/), I have added Mode columns to the following reports:

- [Aggregate Scores](https://reports.wwdt.me/panelists/aggregate-scores)
- [Lightning Fill In The Blank Statistics Summary](https://reports.wwdt.me/panelists/lightning-statistics-summary)
- [Statistics by Gender](https://reports.wwdt.me/panelists/statistics-by-gender)
- [Statistics Summary](https://reports.wwdt.me/panelists/statistics-summary)
- [Statistics Summary by Year](https://reports.wwdt.me/panelists/statistics-summary-by-year)

For the "Lightning Fill In The Blank Statistics Summary" report, the Mode column has been added to the Start, Correct and Total column sections.

In all cases, if there are multiple mode values available for a particular panelist, an Info icon (<i class="px-1 bi bi-info-circle" aria-hidden="true"></i>) is displayed and all mode values are listed in a tooltip.

Lastly, for the [Wait Wait Stats Page](https://stats.wwdt.me/), the mode value(s) calculated based on each panelist's scoring data is included in the Scoring section. Similar to the Reports Site, if there are multiple mode values, an Info icon is displayed with all values are listed in a tooltip.

### Additional Updates

Along with the new mode values being calculated and displayed, the Reports Site, Stats Page and the [Graphs Site](https://graphs.wwdt.me/) received some early spring cleaning.

After migrating the Reports Site from using [Pure CSS](https://pure-css.github.io/) to [Bootstrap](https://getbootstrap.com/), I left the old Pure CSS-related static files in with the site code. The latest version of the application jettisons those files.

Both the Graphs Site and the Stats Page migrated from Materialize to Bootstrap and I continued to include the Materialize-related files with the site code. The latest versions of both applications have also jettisoned the Materialize files.

### Changelogs and Release Notes

- [Wait Wait Graphs Site](https://github.com/questionlp/graphs.wwdt.me/blob/main/CHANGELOG.md)
- [Wait Wait Reports Site](https://github.com/questionlp/reports.wwdt.me/blob/main/CHANGELOG.md)
- [Wait Wait Stats API](https://github.com/questionlp/api.wwdt.me_v2/blob/main/CHANGELOG.md)
- [Wait Wait Stats Library](https://docs.wwdt.me/latest/changes/index.html)
- [Wait Wait Stats Page](https://github.com/questionlp/stats.wwdt.me/blob/main/CHANGELOG.md)
- [Wait Wait Stats Project Bootstrap](https://github.com/questionlp/wwdtm-theme/releases)
