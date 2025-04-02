---
layout: post
title:  "Wait Wait Stats Updates: April 2024"
date:   2024-04-24 22:10:00 -0800
tags:   waitwait update
---

While it's been a few months since I last shared a Wait Wait Stats development update, I've worked on several new features.

### NPR.org Show URLs

Until January of this year, the "NPR" link for each show entry on the [Wait Wait Stats Page](https://stats.wwdt.me) was generated using one of two templates: legacy [NPR.org](https://npr.org) URL for shows before 2006 and current NPR.org URL for shows starting in 2006. Several years ago, NPR changed the URL format used for each episode of Wait Wait, thus causing the generated URL for newer shows to not point to the specific episode page.

With the help of David Moss, who helped to collect all of the URLs for the individual episode pages on NPR.org, I updated the [Wait Wait Stats Database](https://github.com/questionlp/wwdtm_database), [Stats API](https://api.wwdt.me), and the Stats Page to support and use the correct URLs. If a show URL is not entered into the database, the Stats Page will still use the existing URL template as a fallback.

The show URL for each show is also included in show objects returned by the Stats API.

### Location Coordinates and Map

A little over two years ago, a [pull request](https://github.com/questionlp/stats.wwdt.me/pull/17) was opened for the Wait Wait Stats Page with a feature that included a map showing the venue's location on the location details page. I was interested in adding the feature, though it would require extending the Wait Stats Database to add columns to store a location's latitude and longitude, collecting and entering the data, and extending the [Stats Library](https://github.com/questionlp/wwdtm), Stats Page, and Stats API.

In the past several weeks, I found some spare time to collect the data, extend the locations table schema, and incorporate the changes submitted in the pull request. I also took the opportunity to change how the city and state were displayed for each location on the Stats Page.

Instead of showing the two-letter postal abbreviation for each state (as entered in the Stats Database), the whole state name is now displayed. On the details page for each location, the city and state are now listed within the information block rather than the header. The corresponding decimal latitude and longitude coordinates are listed next to the city and state. Hovering over the coordinates will display the DMS (degree, minute, and second) representation of the coordinates as a tooltip.

Thanks to the JavaScript library [Leaflet](https://leafletjs.com), the interactive map uses tiles from [OpenStreetMap](https://openstreetmap.org) and includes a marker representing the location's coordinates. Clicking on the marker will display the location name, city, and state.

### Preferred Pronouns

While extending the Stats Database for the location map feature, I added a preferred pronouns column to the corresponding hosts, panelists, and scorekeeper tables. I also updated the Stats Library and the Stats API to retrieve and present the new data.

At this point, I have not entered any data for each host, panelist, or scorekeeper, and the Stats Page still needs to be updated to display their preferred pronouns. I'll need to collect information from primary sources and enter them into the database as time permits.

Once I have enough data entered into the Stats Database and add the feature to display the preferred pronouns on the Stats Page, I will remove the gender column from the corresponding tables and the returned Stats API objects. This also means that one or two reports in the [Reports](https://reports.wwdt.me) site will be removed.

Having a gender column no longer makes sense from a data or societal norms perspective. I will post updates once support for displaying preferred pronouns has been added and the deprecation and removal of gender-related data has been removed.

### Support the Wait Wait Stats Project

If you would like to support the continual development of the Wait Wait Stats Project or help cover the hosting costs, please consider donating via [GitHub Sponsors](https://github.com/sponsors/questionlp).
