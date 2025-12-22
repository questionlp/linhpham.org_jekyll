---
layout: post
title:  "Wait Wait Stats Updates: Decimal Scores"
date:   2023-08-28 21:30:00 -0700
tags:   stats waitwait update
---

Since publishing the "[Wait Wait Shows From 1998 to 1999]({{ site.url }}{% post_url 2023-08-12-wait-wait-shows-from-1998-1999 %})" blog post, I have listened to the [Wait Wait Don't Tell Me!](https://waitwait.npr.org/) shows that aired from January 1998 through April 1998. While listening to those shows, I was surprised that panelists could receive half points during various segments. This forced me to think of what changes I would need to create in the various Wait Wait Stats applications and the Stats database.

I set out one requirement when making the changes: maintain backward compatibility with previous versions of the Wait Wait Stats library and the Wait Wait Stats API. Changing only the panelist score column type from integer to decimal would be a significant change, requiring a major version bump to both the library and the API and breaking applications that use either.

This blog post covers the changes made in the new versions of the Wait Wait Stats applications.

### Stats Database Changes

Regarding the Stats database, I added a new column to the `ww_showpnlmap` database table called `panelistscore_decimal` to complement the existing `panelistscore` column. The new column's type is set to `decimal(10, 2)` to allow the possibility of giving quarter or third points to panelists. I opted against using a floating point type due to concerns with precision, especially after several sets of calculations and comparisons between floating point numbers would cause issues down the line. This necessitates a minor version bump to the Stats database from version 4.1 to 4.2.

### Stats Library and Site Changes

Since the Stats Page, API, and Graphs site all depended on the Stats library, I had to start making changes there. For any of the methods in the panelist or show module that return panelist scores, an optional boolean argument has been added named `include_decimal_scores` or `use_decimal_scores`. When using the default value of `False`, the data returned will be as it had been before the change.

When `include_decimal_scores` is set to `True` and the object returned is a dictionary or contains a dictionary associated with a panelist's appearance, a new `score_decimal` key will be included with the corresponding value from the `panelistscore_decimal` column. The `score` key and value would still return an integer score value from the `panelistscore` column. When `use_decimal_scores` is set to `True` and the object returned is a series of scores, or it is returning calculated scores, the value returned will be based on the `panelistscore_decimal` column and not the `panelistscore` column.

For the Stats Page, API, and Graphs site, a new `use_decimal_scores` feature flag has been added, with a default value of `false`, and will be used when calling the corresponding methods in the Stats library. The Reports site also includes the new feature flag, but it does not use the Stats library; though, it does have a similar effect.

Since the new feature depends on a new column, there are checks in the corresponding applications and the Stats library to verify the column exists before proceeding when either `include_decimal_scores` or `use_decimal_score` arguments are set to `True`. The Stats library will return an empty list, an empty dictionary, an empty tuple, or `None`, depending on the method's returned type.

### Stats API Changes

As mentioned earlier, the Stats API gets a new application version, 2.3.0, that incorporates the new decimal scores. To support the addition of the panelist decimal score column in the database, any objects representing a panelist's appearance on the show will include a `score_decimal` value alongside the original `score` value. If the `use_decimal_scores` feature flag is set to `false`, the value will still be present in the returned object but will be set to `null`. If the feature flag is set to `true`, the value will contain the panelist's decimal score, if available.

### Wrapping Up

Although the new versions of the Stats Page, API, Graphs, and Reports have been published to GitHub, it will take some time for The latest versions of the Stats Page, API, Reports, and Graphs applications to be rolled out in production within the next week.

If you would like to view the release notes for the new versions of the Stats library and applications, check out the following links:

- Stats Library (`wwdtm`) v2.2.0
  - [Release Notes](https://github.com/questionlp/wwdtm/releases/tag/v2.2.0)
  - [Repository](https://github.com/questionlp/wwdtm)
  - [Read the Docs](https://docs.wwdt.me/en/v2.2.0/)
- Stats API v2.3.2
  - [Release Notes](https://github.com/questionlp/api.wwdt.me_v2/releases/tag/v2.3.2)
  - [Repository](https://github.com/questionlp/api.wwdt.me_v2)
- Stats Page v5.4.0
  - [Release Notes](https://github.com/questionlp/stats.wwdt.me/releases/tag/v5.4.0)
  - [Repository](https://github.com/questionlp/stats.wwdt.me)
- Graphs Site v2.3.0
  - [Release Notes](https://github.com/questionlp/graphs.wwdt.me/releases/tag/v2.3.0)
  - [Repository](https://github.com/questionlp/graphs.wwdt.me)
- Reports Site v2.4.0
  - [Release Notes](https://github.com/questionlp/reports.wwdt.me/releases/tag/v2.4.0)
  - [Repository](https://github.com/questionlp/reports.wwdt.me)
