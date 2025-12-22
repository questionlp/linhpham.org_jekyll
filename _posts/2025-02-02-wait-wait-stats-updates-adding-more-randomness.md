---
layout: post
title:  "Wait Wait Stats Updates: Adding More Randomness"
date: 2025-02-02 22:05 -0800
tags: stats waitwait update
---

Back in February 2021, I published a blog post title, "[That's So... Randomizer](https://blog.wwdt.me/2021/02/thats-so-randomizer/)", on the old [Wait Wait Stats Project Blog](https://blog.wwdt.me/) announcing a new feature I added to the [Wait Wait Stats Page](https://stats.wwdt.me/) with the ability to view a random Not My Job guest, host, location, panelist, scorekeeper or show from the corresponding pages. In the same blog post, I mentioned that I would look at adding corresponding API endpoints to the [Wait Wait Stats API](https://api.wwdt.me/). Four years later, I guess it was finally time to add those API endpoints and a few other features to both the Stats Page and the Stats API.

### wwdtm Library Updates

To facilitate the new features and updates for both the Stats Page and the Stats API, the [wwdtm](https://github.com/questionlp/wwdtm) library was updated to add methods to retrieve base information, detailed information, ID and slug strings for random guests, hosts, locations, panelists, scorekeepers and shows.

The library also received updates to the `Location` class to provide means to retrieve postal abbreviations and their details. A bug where locations that have `NULL` set for the state column, causing those locations to not be included in location retrieval methods has been fixed. This fix is propagated to both the Stats Page and the Stats API.

Additional information on the changes and documentation on the API methods can be found in the [Changes document](https://docs.wwdt.me/latest/changes/index.html) on [docs.wwdt.me](https://docs.wwdt.me/).

### Stats Page Updates

With the code for retrieving random guests, hosts, locations, panelists, scorekeepers and shows being added to the `wwdtm` library, the Stats Page now references the corresponding methods and the previous code has been removed from the Stats Page codebase.

In addition to being able to get random shows across a set of all shows, there is now an ability to get a random show for a specific year. A "Random Show from" link is available when browsing a specific year's page. This new feature also makes use of updates made to the `wwdtm` library.

Additional information on other recent updates to the Stats Page can be found on GitHub under [stats.wwdt.me Releases](https://github.com/questionlp/stats.wwdt.me/releases).

### Stats API Updates

New Stats API endpoints have been added to expose all of the new features that have been added to the `wwdtm` library mentioned above. The following is a brief breakdown of the new endpoints that have been made available:

* `/guests`
  * `/random`
    * Returns base information for a random Not My Job guest
  * `/random/details`
    * Returns detailed information for a random Not My Job guest
  * `/random/id`
    * Returns a random Not My Job guest's database ID
  * `/random/slug`
    * Returns a random Not My Job guest's slug string
* `/hosts`
  * `/random`
    * Returns base information for a random host
  * `/random/details`
    * Returns detailed information for a random host
  * `/random/id`
    * Returns a random host's database ID
  * `/random/slug`
    * Returns a random host's slug string
* `/locations`
  * `/postal-abbreviations`
    * Returns an array of two-letter postal abbreviations
  * `/postal-abbreviations/details`
    * Return an array of objects containing postal abbreviations, along with each corresponding name and country
  * `/postal-abbreviations/details/{abbreviation}`
    * Returns an object containing the corresponding name and country for a given postal abbreviation
  * `/random`
    * Returns base information for a random location
  * `/random/recordings`
    * Return detailed information for a random location with corresponding show recordings
  * `/random/id`
    * Returns a random location's database ID
  * `/random/slug`
    * Returns a random location's slug string
* `/panelists`
  * `/random`
    * Returns base information for a random panelist
  * `/random/details`
    * Returns detailed information for a random panelist
  * `/random/id`
    * Returns a random panelist's database ID
  * `/random/slug`
    * Returns a random panelist's slug string
* `/scorekeepers`
  * `/random`
    * Returns base information for a random scorekeeper
  * `/random/details`
    * Returns detailed information for a random scorekeeper
  * `/random/id`
    * Returns a random scorekeeper's database ID
  * `/random/slug`
    * Returns a random scorekeeper's slug string
* `/shows`
  * `/details/random`
    * Returns detailed information for a random show
  * `/details/random/year/{year}`
    * Returns detailed information for a random show for a given year
  * `/random`
    * Returns base information for a random show
  * `/random/id`
    * Returns a random show's database ID
  * `/random/date`
    * Returns a random show's date in ISO format (i.e.: `YYYY-MM-DD`)
  * `/random/year/{year}`
    * Returns base information for a random show for a given year

More information on the API endpoints and the expected response models is available in the [Stats API redoc page](https://api.wwdt.me/v2.0/docs) or the [Stats API Swagger UI](https://api.wwdt.me/v2.0/openapi).

Additional release notes can be found on GitHub under [api.wwdt.me_v2 Releases](https://github.com/questionlp/api.wwdt.me_v2/releases).

### Wait Wait Stats Project Blog Updates

In the past couple of weeks, I have migrated the (inactive and now archived) Wait Wait Stats Project Blog, [blog.wwdt.me](https://blog.wwdt.me/), from being a self-hosted WordPress site to a statically generated site build using [Eleventy](https://www.11ty.dev/).

The reason for migrating away from WordPress is primarily driven by the recent actions taken by the current CEO of Automattic, and by reducing the system resources required to host a site that has been inactive (after I started posting Wait Wait Stats Project updates on this blog).

All of the blog posts and images from blog.wwdt.me are now licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/).

The site code itself is published under the terms of the [MIT License](https://github.com/questionlp/blog.wwdt.me_11ty/blob/main/LICENSE.md), the same license as the [eleventy-base-blog](https://github.com/11ty/eleventy-base-blog) code that it is based on.

The `wwdtm` library, Wait Wait Stats API and the Stats Page are all licensed under the terms of the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).
