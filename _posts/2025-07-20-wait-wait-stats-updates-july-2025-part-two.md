---
layout: post
title:  "Wait Wait Stats Updates: July 2025 Part Two"
date:   2025-07-20 18:40:00 -0700
tags:   stats waitwait update
---

Since I published [the last Wait Wait Stats Updates]({{ site.url }}{% post_url 2025-07-01-wait-wait-stats-updates-july-2025 %}) three weeks ago, I have been working a number of updates to the [Wait Wait Graphs Site](https://graphs.wwdt.me/) and a couple of minor updates for the [Wait Wait Stats Page](https://stats.wwdt.me/) and [Wait Wait Reports Site](https://reports.wwdt.me/).

### Graphs Site Updates

#### Color Palette Changes

When I [migrated the Graphs Site from Materialize to Bootstrap]({{ site.url }}{% post_url 2024-09-05-wait-wait-graphs-version-3-published %}), I chose the set of colors for the different plots to have some contrast between different lines or bars based on the colors used by [Wait Wait Don't Tell Me!](https://waitwait.npr.org/), [NPR](https://npr.org/), and the [IBM Design Language](https://www.ibm.com/design/language/color/).

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20250720/shows-counts-by-year-previous-colors.png">
            <img src="/assets/images/waitwait/20250720/shows-counts-by-year-previous-colors.png" class="img-fluid border" alt="Shows Counts by Year graph using the previous graph color palette">
            </a>
            <figcaption class="figure-caption text-center">
                Shows Counts by Year graph using the previous color palette
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20250720/shows-counts-by-year-new-colors.png">
            <img src="/assets/images/waitwait/20250720/shows-counts-by-year-new-colors.png" class="img-fluid border" alt="Shows Counts by Year graph using the previous graph color palettes">
            </a>
            <figcaption class="figure-caption text-center">
                Shows Counts by Year graph using the new color palette based on the Carbon Design System
            </figcaption>
        </figure>
    </div>
</div>

What I didn't consider at the time was checking to see if the colors would be visible for people who have protanopia, deuteranopia, tritanopia, or achromatopsia. After using the [color vision simulator](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/simulation/index.html) included with the Firefox DevTools, I noticed that some of the colors would no longer have the same level of contrast or the two colors would not be distinguishable when simulating for protanopia, deuteranopia, tritanopia, or achromatopsia.

After looking around for sets of colors that would meet the requirements, I decided to use a modified versions of the [Carbon Design System color palettes for data visualization](https://carbondesignsystem.com/data-visualization/color-palettes/). The Carbon Design System is based on the [IBM Design Language](https://www.ibm.com/design/language/) that I adapted for the Wait Wait Stats Project.

For line and bar graphs, I based the colors on the "5-Color Group" options for both light and dark color modes. The light mode color palette uses the same first three colors (Purple 70, Cyan 50 and Teal 70), but I replaced Magenta 70 with Purple 30 and kept Red 90. The reason for the change was that Teal 70 and Magenta 70 are too similar when simulating deuteranopia or achromatopsia. The dark mode color palette uses the same colors and ordering as listed in the Carbon Design System color palettes.

As such, purple is now the primary color used for all graphs instead of blue. This will also help differentiate plots within the graphs from the rest of the user interface.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20250720/shows-monthly-average-score-previous-colors.png">
            <img src="/assets/images/waitwait/20250720/shows-monthly-average-score-previous-colors.png" class="img-fluid border" alt="Shows Monthly Average Score Heatmap using the previous graph color palette">
            </a>
            <figcaption class="figure-caption text-center">
                Shows Monthly Average Score Heatmap using the previous graph color palette
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20250720/shows-monthly-average-score-new-colors.png">
            <img src="/assets/images/waitwait/20250720/shows-monthly-average-score-new-colors.png" class="img-fluid border" alt="Shows Monthly Average Score Heatmap using the new graph color palette">
            </a>
            <figcaption class="figure-caption text-center">
                Shows Monthly Average Score Heatmap using the new color palettes based on the Carbon Design System
            </figcaption>
        </figure>
    </div>
</div>

For the two heatmap graphs, I replaced the orange and yellow gradient with the purple gradient from the Carbon Design System, but changed the weighting of the values a little and set the zero value to black (`#ffffff`) to increase overall contrast of the graphs when rendering the datasets. If the datasets had more varying data, the default range and weighting would have worked out well.

The color palettes are configured through the `colors.yaml` file at the root of the Python application directory and is read in as part of the Flask and Jinja initialization process. I chose to use YAML instead of JSON as it is more readable while being easier to update and have comments. Yes, I know about JSONC. I just preferred YAML in this case.

#### Two New Graphs

In addition to the color palette changes, I added two new graphs to the Graphs Site: [Locations Home vs Away](https://graphs.wwdt.me/locations/home-vs-away) and [Not My Job vs Bluff the Listener Win Ratios](https://graphs.wwdt.me/shows/not-my-job-vs-bluff-win-ratios). As I was creating the reports of the same name, I wanted to create graphs versions to visualize the data.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20250720/locations-home-vs-away.png">
            <img src="/assets/images/waitwait/20250720/locations-home-vs-away.png" class="img-fluid border" alt="New Locations &quot;Home vs Away&quot; Graph">
            </a>
            <figcaption class="figure-caption text-center">
                New Locations "Home vs Away" Graph
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20250720/not-my-job-vs-bluffs.png">
            <img src="/assets/images/waitwait/20250720/not-my-job-vs-bluffs.png" class="img-fluid border" alt="New &quot;Not My Job vs Bluff the Listener Win Ratios&quot; Graph">
            </a>
            <figcaption class="figure-caption text-center">
                New "Not My Job vs Bluff the Listener Win Ratios" Graph
            </figcaption>
        </figure>
    </div>
</div>

For the time being, there will only be one graph in the Locations section of the Graphs Site. I'm am looking at creating a visual version of the [Recordings by Year](https://reports.wwdt.me/locations/recordings-by-year) report in the future.

#### Things to Do

As it stands, changing the color theme using the dropdown in the upper right corner of each page will not change the color scheme used by the graphs. Instead, the graph scheme is determined by the `prefers-color-scheme` value provided by the browser. Changing the `prefers-color-scheme` value on the fly also does not trigger the graph to automatically change color schemes.

Both are known bugs and have been bugs since I switched from using [Chart.js](https://www.chartjs.org/) to [Plotly JS](https://plotly.com/javascript/) and have not had enough time or JavaScript know-how to solve that problem. I'll be spending a little bit of spare time over the next couple of months to figure out fixes for both bugs.

I will also be working on removing unnecessary legends from graphs that only have one data category to reduce clutter within graphs.

### Stats Page Updates

When I [migrated the Stats Page from Materialize to Bootstrap]({{ site.url }}{% post_url 2024-08-31-announcing-wait-wait-stats-page-version-6 %}), I changed how the Not My Job Guest scoring exception was displayed on the show details information block to include a tooltip on hovering over the asterisk shown after the score. Unfortunately, the way that I handled that logic meant that the full `<span>` was included, but only the asterisk was rendered as needed.

I noticed the issue when I started using the [axe DevTools](https://www.deque.com/axe/devtools/) extension in Firefox to find other potential accessibility issues with the Wait Wait Stats Project sites. The tool reported an issue with an incorrect use of ARIA properties as generated by the Bootstrap tooltip component when the `<span>` was empty.

An update was made to only render the full `<span>` if and only when there is a scoring exception.

### Other Updates

As I was finalizing and testing the changes to the [Graphs Site](https://graphs.wwdt.me/), the news that the United States Congress rescinded funding for public media and broadcasting (coverage from [AP News](https://apnews.com/article/pbs-npr-budget-cuts-trump-republicans-b0044285659ab708e23eb2dc2f3eabfa) and [NPR](https://www.npr.org/2025/07/18/nx-s1-5469912/npr-congress-rescission-funding-trump)), I decided to add a "Support NPR" link to the side pop-out navigation and to the page footer of the Graphs Site, the [Reports Site](https://reports.wwdt.me/) and the [Stats Page](https://stats.wwdt.me/), that points to [NPR's donation page](https://www.npr.org/donations/support).

I know, it probably won't drive anyone to click on the link and donate to NPR, but I wanted to show my support on top of donations to local and regional stations.

For troubleshooting and debugging purposes, I have discreetly added the name of the node that rendered the page when hovering over the page render timestamp at the bottom of each page. This can be helpful when trying to find the source of intermittent issues and inconsistent behavior on load balanced servers where it works fine on some nodes but not others.

### Release Changelogs

For additional information about the changes included in each version of the Wait Wait Graphs Site, Reports Site and Stats Page, refer to the corresponding changelog files below:

- [graphs.wwdt.me](https://github.com/questionlp/graphs.wwdt.me/blob/main/CHANGELOG.md)
- [reports.wwdt.me](https://github.com/questionlp/reports.wwdt.me/blob/main/CHANGELOG.md)
- [stats.wwdt.me](https://github.com/questionlp/stats.wwdt.me/blob/main/CHANGELOG.md)
