---
layout: post
title:  "Wait Wait Stats Updates: December 2025"
date:   2025-12-30 20:15:00 -0800
tags:   stats waitwait update
---

Since the [previous Wait Wait Stats Update in November]({{ site.url }}{% post_url 2025-11-01-wait-wait-stats-update-november-2025 %}), there have been several key updates to the Wait Wait Stats Project.

### Wait Wait Stats Wrapped 2025

A week ago, I published the second iteration of the [Wait Wait Stats Wrapped]({{ site.url }}{% post_url 2025-12-22-wait-wait-stats-wrapped-2025 %}) infographics.

For the 2025 edition, I copied the LibreOffice Impress presentation that I used to create the 2024 edition and made a few changes:

* Removed almost all instances of using capital letters, save for the first infographic image.
* Removed almost all rotated text for the infographic image titles.
* Made use of tables for the statistics layout to improve consistency.

The new edition also added new statistics for show hosts, show scorekeepers, a comparison of the Bluff the Listener and Not My Job guest win rates, and Not My Job guest statistics.

In addition to publishing the images to Flickr ([Wait Wait Stats Wrapped 2025 album](https://www.flickr.com/photos/questionlp/albums/72177720331077624)) and publishing the source and generated files to the [wait-wait-stats-wrapped](https://github.com/questionlp/wait-wait-stats-wrapped) repository on GitHub, I also published the [wait-wait-stats-wrapped](https://codeberg.org/qlp/wait-wait-stats-wrapped) repository over on Codeberg.

### Wait Wait Stats Page

The [Wait Wait Stats Page](https://stats.wwdt.me/) saw a minor fix to the appearances list in the Panelist details page. Previously, the panelist scoring information could end up being split across columns making it harder to read and scan for scores. The fix adds a `break-inside: avoid-column` to the the styling for `.appearances-list li`.

Another small update was to remove an unnecessary `aria-labelledby` in the navigation menu, which was causing validation errors when running high-level accessibility tests.

* Wait Wait Stats Page Changelog: <https://github.com/questionlp/stats.wwdt.me/blob/main/CHANGELOG.md>
* Wait Wait Stats Page Releases: <https://github.com/questionlp/stats.wwdt.me/releases>

### Wait Wait Graphs Site

Most of my work on the Wait Wait Stats Project had been focused on adding a number of [Wait Wait Graphs Site](https://graphs.wwdt.me/) charts for show hosts, locations, scorekeepers, and show details.

The following sections cover the new charts and some background in their creation. Additional information of the changes and additions can be found in the following links.

* Wait Wait Graphs Site Changelog: <https://github.com/questionlp/graphs.wwdt.me/blob/main/CHANGELOG.md>
* Wait Wait Graphs Site Releases: <https://github.com/questionlp/graphs.wwdt.me/releases>

#### Show Locations Charts

The first new chart is the "[Recordings by State](https://graphs.wwdt.me/locations/recordings-by-state)" choropleth map that represents the number of show recordings made in each state

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/202512/recordings-by-state.png">
            <img src="/assets/images/waitwait/202512/recordings-by-state.png" class="img-fluid border" alt="Choropleth map of the United States with the number of show recordings for each state">
            </a>
            <figcaption class="figure-caption text-center">
                Recordings by State Choropleth Map
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/202512/all-locations-shows-heatmap.png">
            <img src="/assets/images/waitwait/202512/all-locations-shows-heatmap.png" class="img-fluid border" alt="Heatmap of the different recording location types for all shows">
            </a>
            <figcaption class="figure-caption text-center">
                All Locations Shows Heatmap
            </figcaption>
        </figure>
    </div>
</div>

The Locations section of the Graphs Site has four new heatmaps that plot out home shows (shows recorded in Chicago, Illinois), away shows, and shows recorded from Home/Remote Studios. Each row along the y-axis represents a year and each column along the x-axis represents a show week number. I couldn't use show dates for each year due to rendering issues when plotting out heatmaps. This also means that the tooltips do not include the show date. The new charts are:

* [All Locations Shows Heatmap](https://graphs.wwdt.me/locations/all-locations-shows-heatmap)
* [Away Shows Heatmap](https://graphs.wwdt.me/locations/away-shows-heatmap)
* [Home Shows Heatmap](https://graphs.wwdt.me/locations/home-shows-heatmap)
* [Home/Remote Studios Shows Heatmap](https://graphs.wwdt.me/locations/home-remote-studios-shows-heatmap)

I also created a "[Show Location Types by Year](https://graphs.wwdt.me/locations/show-location-types-by-year)" chart that plots out each show's location type for a particular year. The chart was created as an alternative view for the "All Locations Shows Heatmap" that has show dates rather than show week numbers.

#### Show Hosts and Scorekeepers Charts

In the same vein as the new heatmap and types by year charts that I created for show locations, I created similar charts for show host types and scorekeeper types. I wanted a visual representation of when shows had a guest host or a guest scorekeeper over the years.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/202512/show-host-types-by-year-2025.png">
            <img src="/assets/images/waitwait/202512/show-host-types-by-year-2025.png" class="img-fluid border" alt="Bar chart with show host types for 2025">
            </a>
            <figcaption class="figure-caption text-center">
                Show Host Types by Year Chart for 2025
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/202512/show-scorekeepers-heatmap.png">
            <img src="/assets/images/waitwait/202512/show-scorekeepers-heatmap.png" class="img-fluid border" alt="Heatmap of the different show scorekeeper types for all shows">
            </a>
            <figcaption class="figure-caption text-center">
                Show Scorekeepers Heatmap
            </figcaption>
        </figure>
    </div>
</div>

The "[Show Hosts Heatmap](https://graphs.wwdt.me/hosts/show-hosts-heatmap)" and "[Show Scorekeepers Heatmap](https://graphs.wwdt.me/scorekeepers/show-scorekeepers-heatmap)" have the same limitations as the location heatmaps mentioned above. I created the corresponding "[Show Host Types by Year](https://graphs.wwdt.me/hosts/show-host-types-by-year)" and "[Show Scorekeeper Types by Year](https://graphs.wwdt.me/scorekeepers/show-scorekeeper-types-by-year)" charts that plot out the same information for a given year and charts use show dates rather than show week numbers.

#### Show Types Charts

The last set of charts follows the same theme as the new show host and show scorekeeper charts with a "[Show Types Heatmap](https://graphs.wwdt.me/shows/show-types-heatmap)" and a "[Show Types by Year](https://graphs.wwdt.me/shows/show-types-by-year)" bar chart.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/202512/show-types-heatmap.png">
            <img src="/assets/images/waitwait/202512/show-types-heatmap.png" class="img-fluid border" alt="Heatmap of the different show types for all shows">
            </a>
            <figcaption class="figure-caption text-center">
                Show Types Heatmap
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/202512/show-types-by-year-2018.png">
            <img src="/assets/images/waitwait/202512/show-types-by-year-2018.png" class="img-fluid border" alt="Bar chart with show types for 2018">
            </a>
            <figcaption class="figure-caption text-center">
                Show Types by Year Chart for 2018
            </figcaption>
        </figure>
    </div>
</div>

The "Show Types Heatmap" chart plots out the different show types (regular, Best Of, repeat, and repeat Best Of shows) for all years. I wanted to create the heatmap to quickly see what kind of patterns that are for when Best Of and repeat shows tend to occur.

The "Show Types by Year" chart is an alternative view of the data presented by the "Show Types Heatmap" but for a given year. It also complements the "[Counts by Day of Month](https://graphs.wwdt.me/shows/counts-by-day-month)" and "[Counts by Year](http://graphs.dev.wwdt.me/shows/counts-by-year)" charts that provides information at a much more aggregate level.

### Wait Wait Reports Site

While working on the Wait Wait Stats Wrapped for this year, I noticed that the [Wait Wait Reports Site](https://reports.wwdt.me/) was missing a report when it came to Best Of shows that have unique Bluff the Listener segments.

When [Wait Wait... Don't Tell Me!](https://waitwait.npr.org) records a show away from Chicago, they will sometimes record two shows: a regular show on Thursday that airs that weekend and a second show with a new Not My Job guest and some new content. One of those segments that have new content can be the Bluff the Listener segment. When that happens and the segment makes it into a future Best Of show, it would be considered a unique Bluff the Listener segment.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/waitwait/202512/best-of-shows-with-unique-bluff-segments.png">
    <img src="/assets/images/waitwait/202512/best-of-shows-with-unique-bluff-segments.png" class="img-fluid border" alt="Report with unique Bluff the Listener segments from Best Of shows">
    </a>
    <figcaption class="figure-caption text-center">
        Best Of Shows with Unique Bluff the Listener Segments
    </figcaption>
</figure>

For the Stats Project, I will only record the panelist with the chosen Bluff story and the panelist with the currect Bluff story to minimize duplicated data that can throw off some of the statistics. In the database, there is a flag in the `ww_shows` table that denotes if a Best Of show has a unique Bluff the Listener segment.

The new "[Best Of Shows with Unique Bluff the Listener Segments](https://reports.wwdt.me/shows/best-of-shows-with-unique-bluff-segments)" report lists out those unique segments with the corresponding chosen and correct panelists.

* Wait Wait Reports Site Changelog: <https://github.com/questionlp/reports.wwdt.me/blob/main/CHANGELOG.md>
* Wait Wait Reports Site Releases: <https://github.com/questionlp/reports.wwdt.me/releases>

### Miscellaneous Stuff

At the end of the "[Wait Wait Stats: Going All Retro (Sort Of)]({{ site.url }}{% post_url 2025-08-09-wait-wait-stats-going-all-retro-sort-of %})" post, I write that I would start with backfilling segment information for shows that aired in 2006. To help with the process, I used the individual segment audio files that NPR has available online, started listening through each, take notes, and enter the information into the database. It is a laborious process and I don't immediately trust more common AI-based transcription options that I can run offline (my thoughts on AI, GenAI, AGI, and LLMs could easily fill multiple blog posts).

Although I made it through the September 20, 2008 show, I had to pause the project due to general burn out and spend time on self-care and work back to a relatively normal level. I haven't and don't have any immediate plans to restart the project.

That wrap things up for the Wait Wait Stats Project in 2025. Looking forward to what 2026 will bring to both Wait Wait and the Stats Project!
