---
layout: post
title:  "Wait Wait Stats: Going All Retro (Sort Of)"
date:   2025-08-09 18:00:00 -0700
tags:   waitwait update
---

When I migrated the web front-end framework for the [Wait Wait Stats Page](https://stats.wwdt.me/), [Reports Site](https://reports.wwdt.me/) and [Graphs Site](https://graphs.wwdt.me/) over to [Bootstrap](https://getbootstrap.com/), I implemented a color theme selector that would allow people to use the browser or system-preferred color scheme or specifically select either a light color theme or a dark color theme. There is now a new retro-inspired "middle" color theme available named "Retro". I know, not exactly a creative or unique name.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/waitwait/retro-theme/netscape-2-windows-2000.png">
    <img src="/assets/images/waitwait/retro-theme/netscape-2-windows-2000.png" class="img-fluid border" alt="Previous version of the Wait Wait Stats Page being shown in a Netscape Navigator 2 browser on Windows 2000">
    </a>
    <figcaption class="figure-caption text-center">
        Stats Page Version 3 viewed on Netscape Navigator 2.0
    </figcaption>
</figure>

A little over a week ago, from when I wrote this blog post, I saw a post made by Veronica Explains on Mastodon about wanting to see more light, middle and dark mode designs. The post sparked the idea of creating a "middle" color theme that was inspired by the memory of using Netscape Navigator 2 and 3 on Macintosh computers back in the mid-1990s when I was still in high school (yes, that means that I am officially an *ancient*), then on Windows 3.1 computers before getting introduced to Windows 95.

The base background color used by Netscape Navigator was a silver color that is generally denoted as `#c0c0c0` (or `#cbcbcb`) in hexidecimal RGB. Netscape also defaulted to a serif font, "Times New Roman" on Windows, instead of the more ubiquitous sans-serif fonts that are more common today. I also decided to stick with a more limited color palette that was common back then due to computers either supporting only hundreds of colors (or 256, or 8-bit, in PC-speak) and higher-end systems supporting thousands of colors (or 65,536, or 16-bit, in PC-speak).

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/retro-theme/stats-page-light.png">
            <img src="/assets/images/waitwait/retro-theme/stats-page-light.png" class="img-fluid border" alt="Show Details for the September 20, 2008 on the Wait Wait Stats Page shown with the light color theme">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Stats Page Shows Details shown with the light color theme
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/retro-theme/stats-page-retro.png">
            <img src="/assets/images/waitwait/retro-theme/stats-page-retro.png" class="img-fluid border" alt="Show Details for the September 20, 2008 on the Wait Wait Stats Page shown with the retro color theme">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Stats Page Shows Details shown with the retro color theme
            </figcaption>
        </figure>
    </div>
</div>

When selecting colors that I would use for the new Retro color theme, I restricted myself to the named colors listed in the [HTML 3.2 specifications](https://www.w3.org/TR/2018/SPSD-html32-20180315/) and from the [216-color "web-safe" palette](https://en.wikipedia.org/wiki/Web_colors#Web-safe_colors) commonly used when exporting images or choosing colors back in the mid- to late-1990s. The colors that I selected also had to closely match the colors that I already use on the sites, while maintaining a minimum of a WCAG AA rating (4.5:1) when using `#c0c0c0` as the page background color.

Since I made things a little easier by creating a shared [Wait Wait Stats Project Theme](https://github.com/questionlp/wwdtm-theme) project that contains and builds all of the necessary Bootstrap-related files and custom styles as part of migrating to Bootstrap, I made changes the necessary changes to that project, tested them against the Stats Page, fixed any issues, then start testing them on the Graphs Site and Reports Site. The only duplicated work was to update the navigation menu on each site and tweak the JavaScript file used to detect and save the chosen color theme using the `localStorage` mechanism available as part of the [Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API).

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/retro-theme/reports-site-dark.png">
            <img src="/assets/images/waitwait/retro-theme/reports-site-dark.png" class="img-fluid border" alt="Panelist vs Panelist Scoring report on the Wait Wait Reports Site shown with the dark color theme">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Reports Site Panelist vs Panelist Scoring shown with the light color theme
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/retro-theme/reports-site-retro.png">
            <img src="/assets/images/waitwait/retro-theme/reports-site-retro.png" class="img-fluid border" alt="Panelist vs Panelist Scoring report on the Wait Wait Reports Site shown with the retro color theme">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Reports Site Panelist vs Panelist Scoring shown with the retro color theme
            </figcaption>
        </figure>
    </div>
</div>

For the Graphs Site, I selected a separate set of colors for the colorway when the graphs are rendered using the Retro color theme. The order of the colors within the set were chosen to increase contrast between values and are distinguishable when viewed by people with color vision deficiency.

There were some components that use colors that fall outside of the requirements that I set, including the map included in the location details page on the Wait Wait Stats Page and the two heatmap graphs related to show scores on the Wait Wait Graphs Site. The location map uses [Leaflet](https://leafletjs.com/) to render maps from OpenStreetMaps and the documentation doesn't seem to provide any options to limit the color palette of the map tiles. For the heatmap, I set specific range set points in the color scale to colors from the limited color palette, but [Plotly](https://plotly.com/javascript/) will create a gradient for values that fall between set points.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/retro-theme/graphs-site-light.png">
            <img src="/assets/images/waitwait/retro-theme/graphs-site-light.png" class="img-fluid border" alt="Bluff the Listener Counts for 2024 graph on the Wait Wait Graphs Site shown with the light color theme">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Graphs Site Bluff the Listener Counts for 2024 shown with the light color theme
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/retro-theme/graphs-site-retro.png">
            <img src="/assets/images/waitwait/retro-theme/graphs-site-retro.png" class="img-fluid border" alt="Bluff the Listener Counts for 2024 graph on the Wait Wait Graphs Site shown with the retro color theme">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Graphs Site Bluff the Listener Counts for 2024 shown with the retro color theme
            </figcaption>
        </figure>
    </div>
</div>

The version of the Plotly JavaScript library for the Graphs Site has been upgraded from version 3.0.3 to 3.1.0. This also marks the last release version of the Graphs Site that will support and bundle any version prior to 3.0. As such, the `settings.use_plotly_v3` configuration setting will now default to `True` that this point forward.

## What's Next

My next project is to start backfilling segments information for shows starting in 2006 so that they include all segments, including Panel Questions and Lightning Fill-in-the-Blank, where each segment is separated by semi-colons. The goal of having all shows using this format for segment lists is to allow me to later present the segments as a list and affords me the option of separating show segments from show descriptions.

Considering the number of shows from January 2006 through September 2023, this will take quite a bit of time to complete. What is helpful is that I was able to download individual segment audio for nearly all shows between from 2006 through October 2021. That way, I can just listen to the first minute of each segment audio file and quickly note the segment name and move on.

After that, I will start listening to shows from January 2000 up to the end of December 2006 to do the same and, more importantly, verify the data that I've collected for those shows.

Outside of that, I don't have any immediate plans to add new features to the Wait Wait Stats Project sites.

## Release Notes

For more information on the changes included in the new versions of the Wait Wait Stats Project Theme, Wait Wait Stats Page, Graphs Site and Reports Site, checkout out the release notes for each release:

* Wait Wait Stats Project Theme
  * [Version 2.1.0 Release Notes](https://github.com/questionlp/wwdtm-theme/releases/tag/v2.1.0)
* Wait Wait Graphs Site
  * [Version 3.6.0 Release Notes](https://github.com/questionlp/graphs.wwdt.me/releases/tag/v3.6.0)
* Wait Wait Reports Site
  * [Version 4.2.0 Release Notes](https://github.com/questionlp/reports.wwdt.me/releases/tag/v4.2.0)
* Wait Wait Stats Site
  * [Version 6.8.0 Release Notes](https://github.com/questionlp/stats.wwdt.me/releases/tag/v6.8.0)
