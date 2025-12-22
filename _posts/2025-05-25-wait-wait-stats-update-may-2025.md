---
layout: post
title:  "Wait Wait Stats Updates: May 2025"
date:   2025-05-25 19:40:00 -0700
tags:   stats waitwait update
---

In the past few months, I have published a series of updates to each of the Wait Wait Stats Project sites and to the Stats API. While some of the updates have been more behind-the-scenes updates, but there are also a few new features that I wanted to highlight.

### Wait Wait Stats Library

Since the [last update to the Stats Library in February]({{ site.url }}{% post_url 2025-02-02-wait-wait-stats-updates-adding-more-randomness %}), I have added several new methods to retrieve show counts for regular, Best Of, repeat, repeat Best Of and a total for each year.

Also included in the latest version of the [Stats Library](https://github.com/questionlp/wwdtm), version 2.18.2, are methods to retrieve information and details for all Best Of, repeat and repeat Best Of shows across all years or by year. Each of the methods include a `inclusive` parameter that determines whether to include repeat Best Of shows in with Best Of shows and whether to include repeat Best Of shows in with repeat shows. The default value for the `inclusive` parameter for all methods is `True`.

Documentation for the new methods are available in the in the [Wait Wait Stats Library documentation site](https://docs.wwdt.me/latest/) hosted on [Read the Docs](https://about.readthedocs.com/?ref=app.readthedocs.com).

### Wait Wait Stats Project Theme

When I migrated the [Wait Wait Graphs Site](https://graphs.wwdt.me/), [Wait Wait Reports Site](https://reports.wwdt.me/) and the [Wait Wait Stats Page](https://stats.wwdt.me/) to use the [Bootstrap](https://getbootstrap.com/) frontend toolkit from Materialize (or Pure CSS for the Reports Site), I made some significant changes to the variables and custom styles as overrides to the corresponding Bootstrap files. Unfortunately, that made upgrading from one version of Bootstrap to another a lot more complicated and lead to some breaking changes.

As part of creating version 2 of the [Wait Wait Stats Project Theme](https://github.com/questionlp/wwdtm-theme), I went back to basics and started with the base Bootstrap package and only made customizations by way of a handful of custom Sass files and removed distribution of the [IBM Plex](https://www.ibm.com/plex/) web font files from the theme.

I also decided to add NPM scripts that would compile the required Bootstrap, Bootstrap Icons and IBM Plex Sass files and copy the required JavaScript and Icon files into a new `dist` directory.

This also meant that I needed to update how the three sites would consume the `dist` files and copy the required IBM Plex web font files into the appropriate location under `app/static`.

While it did require a lot of work and testing to make sure the functionality of the sites didn't change or break, but it eventually made it much easier to maintain the theme and the sites going forward.

The new theme is now based on Bootstrap 5.3.6 and [Bootstrap Icons](https://icons.getbootstrap.com/) 1.13.1.

### Wait Wait Graphs and Reports Sites

With the new version of the Wait Wait Stats Project Theme completed, I migrated both the Graphs and Reports sites to use the new theme and published new versions of both sites.

Both sites also received a few minor updates, including:

- External links, including to other Wait Wait Stats Project sites, now open in a new window or tab (depending on the behavior and settings of the web browser).
- Addition of a link to my [Bluesky account](https://bsky.app/profile/linh.social) in the footer
- Upgrading to Flask 3.1.1
- Upgrading development dependencies
  - Ruff now at version 0.11.9
  - pytest now at version 8.3.5
  - pytest-cov now at version 6.1.1

The Graphs Site has also been updated to use version 2.18.2 of the Wait Wait Stats Library.

### Wait Wait Stats API

The [Wait Wait Stats API](https://api.wwdt.me/) also received updates to include new endpoints that correspond to the new methods that were added to the latest version of the Wait Wait Stats Library, version 2.18.2. By default, the endpoints include and set the `inclusive` flag to `true`, matching that of the Wait Wait Stats Library.

In addition to the new endpoints, the Stats API now uses a new `MessageDetails` response model and `return JSONResponse` to return messages instead of `raise HTTPException`. This change ensures that the returned responses for non-standard response codes are proper JSON objects.

The Stats API also received behind the scenes changes, including:

- Renaming endpoint function names to be more consistent
- Renaming testing functions to match endpoint function names
- Adding missing tests to three recently added endpoints
- Adding tests to check if endpoints are returning 404 properly when requesting data with no matching values

### Wait Wait Stats Page

As with the Wait Wait Graphs and Reports Sites, the [Wait Wait Stats Page](https://stats.wwdt.me/) was also updated to use version 2 of the Wait Wait Stats Theme package and received several new features and updates.

In addition to the existing pages that provide show details for all Best Of, repeat and repeat Best Of shows, the new version adds pages that provide show details for all Best Of, repeat and repeat Best Of shows for each year. If a given year does not include any Best Of, repeat or repeat Best Of shows, the link to the corresponding pages will not be available.

As with the Graphs and Reports sites, all external links now option in a new window or tab (depending on the behavior and settings of the web browser). Any external links that appear in the main section of the page (excluding links in the navigation bar and menu and the page footer) will include an icon indicating the link will open in a new window or tab.

The About page also receives a small update to include a link to my Bluesky account, along with my contact information. The page footer also includes a link to my Bluesky account.

The Stats Page has also had some of its dependencies updated, including:

- Upgrading to Flask 3.1.1
- Upgrading development dependencies
  - Ruff now at version 0.11.9
  - pytest now at version 8.3.5
  - pytest-cov now at version 6.1.1

### Server Infrastructure Changes

Over the next couple of weeks, I will be making a couple of changes to the servers that host and serve up the Wait Wait Stats Project. The purpose of the change is to optimize the overall hosting costs and to remove another third-party dependency.

There may be some short periods of time when the sites may not be accessible as some of the changes are implemented and services are migrated.

### Links

- [Wait Wait Stats Library Changes](https://docs.wwdt.me/latest/changes/index.html)
- [Wait Wait Stats API Releases and Changes](https://github.com/questionlp/api.wwdt.me_v2/releases)
- [Wait Wait Graphs Site Releases and Changes](https://github.com/questionlp/graphs.wwdt.me/releases)
- [Wait Wait Reports Site Releases and Changes](https://github.com/questionlp/reports.wwdt.me/releases)
- [Wait Wait Stats Page Releases and Changes](https://github.com/questionlp/stats.wwdt.me/releases)
- [Wait Wait Stats Project Theme Version Tags](https://github.com/questionlp/wwdtm-theme/tags)
