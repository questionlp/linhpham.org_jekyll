---
layout: post
title:  "Wait Wait Stats Updates: October 2025"
date:   2025-10-10 21:20:00 -0700
tags:   stats waitwait update
---

It's been almost three months since the last major [Wait Wait Stats Updates]({{ site.url }}{% post_url 2025-07-20-wait-wait-stats-updates-july-2025-part-two %}) post from July 2025 and there have been a couple of updates to the project.

## Stats Page: Panelist Scoring Display Change

Prior to the latest version of the [Wait Wait Stats Page](https://stats.wwdt.me/), the panelist scores on the show and panelist details pages were listed in the form of:

> **Total Score** (**Lightning Fill In The Blank Starting Score** / **Correct Answers**)

Although I added an explanation of what the numbers meant in the [Understanding Wait Wait Stats Page Data](https://stats.wwdt.me/understanding-data) page on the site, I still wanted to make it easier to interpret at a glance.

In the latest version of the Stats Page, the starting score and correct answers are now listed below the panelist's name and their total score, with corresponding labels. The change was made for both show and panelist details pages.

As much as I would prefer to keep the Stats Page as visually clean as possible, not specifically labeling those two numbers lead to ambiguity and required extra effort on people viewing the site to understand what the numbers meant.

There were also some behind the scenes changes that included moving some route corrections from being handled by NGINX to being handled within the web application. While this does increase the time required to handle the redirect, but it means that I can define those redirects in a JSON file and test them without configuring an NGINX proxy on a local system.

* [Wait Wait Stats Page Changelog](https://github.com/questionlp/stats.wwdt.me/blob/main/CHANGELOG.md)

## Reports Site: New Report

For the [Wait Wait Reports Site](https://reports.wwdt.me/), I added a new report called "[First Appearance Answering All Lightning Questions Correct](https://reports.wwdt.me/panelists/first-appearance-all-correct)" that lists panelists who answered all of the Lightning Fill In The Blank questions correct on their first appearance.

I created the report after [KC Shornima](https://stats.wwdt.me/panelists/kc-shornima) had done so on the show that aired on [2025-09-27](https://stats.wwdt.me/shows/2025/09/27) and I wanted to see if any other panelist had done so.

Looking at the "[First Appearance Wins](https://reports.wwdt.me/panelists/first-appearance-wins)" report, I didn't see an instance of that happening before. At that point, I decided to create a report for that purpose, in case a new panelist repeats that feat.

Also, I resolved an issue where the "First Appearance Wins" report would return missing or incomplete data when handling empty panelist results rather than skipping them.

* [Wait Wait Reports Site Changelog](https://github.com/questionlp/reports.wwdt.me/blob/main/CHANGELOG.md)

## Graphs Site: Plotly.js Update

The [Wait Wait Graphs Site](https://graphs.wwdt.me/) got updated with the latest version of the [Plotly.js](https://plotly.com/javascript/) library, version 3.1.1, and some updated graph descriptions to clarify that the graphs only include data for regular shows.

* [Wait Wait Graphs Site Changelog](https://github.com/questionlp/graphs.wwdt.me/blob/main/CHANGELOG.md)

## Wait Wait Stats Project Theme: Dark Mode Updates

When I created a common [Bootstrap setup and theme](https://github.com/questionlp/wwdtm-theme) for the Wait Wait Stats Project, specifically the Stats Page, Graphs Site and Reports Site, I chose to use IBM Gray 100 (`#161616`) from the [color specifications from the IBM Design Language](https://www.ibm.com/design/language/color/#specifications) as the background color and IBM Gray 10 (`#f4f4f4`) as the standard text color for the dark color theme.

After getting some feedback from several folks in regards to readability and accessibility, the extreme contrast between the bright text and very dark background actually made larger blocks of text harder to read or even caused some eye discomfort. To alleviate that, I changed the background color to IBM Gray 90 (`#262626`), which reduced the harshness and still maintain a contrast ratio that meets the [Contrast (Enhanced) (Level AAA) for WCAG 2.2](https://www.w3.org/WAI/WCAG22/Understanding/contrast-enhanced.html).

I am considering going from IBM Gray 90 to IBM Gray 80 (`#393939`) in the future given that there are larger blocks of text that can still be harsh on the eyes.

* [Wait Wait Stats Project Theme Releases](https://github.com/questionlp/wwdtm-theme/releases)

## Wait Wait Stats Library: Python 3.12 and Beyond

I just published a new version of the [Wait Wait Stats Library](https://github.com/questionlp/wwdtm) [[documentation available at docs.wwdt.me](https://docs.wwdt.me/)] in which the minimum required version of Python has been elevated to 3.12 and included updating a fair amount of the core, development and documentation dependencies. While Python 3.10 and 3.11 are still receiving security updates, several dependent packages are considering to or have already deprecated Python 3.10.

While I could have just elevated the minimum version to 3.11, I felt like if I was going to make such a change that I would bring it up to a version that I was already using for development and in production. It also opens the opportunity to make use of the new [f-string handling](https://docs.python.org/3/whatsnew/3.12.html#whatsnew312-pep701) included in Python 3.12.

Along with the minimum Python version change, I started a full round of testing using Python 3.13 and (then release candidate version of) 3.14 to make sure there wasn't any kind of breakage. Thankfully, no new errors were returned in the test cases and no differences between the returned objects between Python 3.12, 3.13 and 3.14.

The new version of the Stats Library also includes provisional support for [MariaDB Server](https://mariadb.org/) 11.8 and 12, in addition to the existing support for [MySQL Server](https://www.mysql.com/) 8.4. I stood up a number of virtual machines and installations of MariaDB Server to run tests of the Stats Library, Stats Page, Reports Site and [Stats API](https://api.wwdt.me/) and did not run into any SQL syntax or feature errors.

This opens the possibility of migrating away from Oracle-backed MySQL Server to something that isn't quite as beholden to Oracle. The move away from MySQL/MariaDB is still planned as part of a major rework of the Stats Library sometime in the future.

* [Wait Wait Stats Library Changelog](https://github.com/questionlp/wwdtm/blob/main/CHANGES.rst)

## Odds and Ends

Although I have made some progress in collecting and entering all segments and segment descriptions for shows starting in 2006 and onwards, I have had to take a number of breaks due to work, events and burn-out in general. Hopefully I'll find some time in the coming months to go through another block of shows, but it is sometime time consuming and, to be honest, pretty tedious work.
