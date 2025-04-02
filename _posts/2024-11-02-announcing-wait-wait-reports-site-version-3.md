---
layout: post
title:  "Announcing Wait Wait Reports Site Version 3!"
date:   2024-11-02 18:45:00 -0700
tags:   waitwait update
---

Earlier this year, I migrated the [Wait Wait Stats Page](https://stats.wwdt.me) and the [Wait Wait Graphs Site](https://graphs.wwdt.me) from the Materialize frontend toolkit to the Bootstrap frontend toolkit. Today, I announce that the [Wait Wait Reports Site](https://reports.wwdt.me) version 3 has been released and uses Bootstrap.

Before version 3, the Reports Site used [Pure CSS](https://pure-css.github.io/) to provide a lightweight, minimal look and feel for a data-intensive website. One downside of Pure CSS is its limited support for responsive tables, which would require significant work to replicate the responsive navigation and form layout features that Bootstrap has included.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20241102/reports-v3-main-light.png">
            <img src="/assets/images/waitwait/20241102/reports-v3-main-light.png" class="img-fluid border" alt="Main page for the Wait Wait Reports Site v3 in light mode">
            </a>
            <figcaption class="figure-caption text-center">
                New main page for Wait Wait Reports Site version 3 in light mode
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20241102/reports-v3-main-dark.png">
            <img src="/assets/images/waitwait/20241102/reports-v3-main-dark.png" class="img-fluid border" alt="Main page for the Wait Wait Reports Site v3 in dark mode">
            </a>
            <figcaption class="figure-caption text-center">
                New main page for Wait Wait Reports Site version 3 in dark mode
            </figcaption>
        </figure>
    </div>
</div>

The new version of the Reports Site uses the same theme as the Stats Page and Graphs Site, albeit with additional cards, forms, and alert box styles. The updated Reports Site also includes automatic light and dark mode support, with the option of choosing which mode to use.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20241102/reports-v3-shows-index.png">
            <img src="/assets/images/waitwait/20241102/reports-v3-shows-index.png" class="img-fluid border" alt="List of available reports from the Show section">
            </a>
            <figcaption class="figure-caption text-center">
                Index page for the Shows section with a list of available reports
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20241102/reports-v3-panelist-pvp.png">
            <img src="/assets/images/waitwait/20241102/reports-v3-panelist-pvp.png" class="img-fluid border" alt="Generated Panelist vs Panelist: All report">
            </a>
            <figcaption class="figure-caption text-center">
                Results from the "Panelist vs Panelist: All" report
            </figcaption>
        </figure>
    </div>
</div>

By leveraging Bootstrap's response design elements, the Reports Site will be easier to view and use on devices with smaller screens. Since all reports present data using tables, horizontal scrolling is available when viewing tables on smaller screens.

The new version of the Reports Site also includes behind-the-scenes changes and makes report URLs more consistent across the board. Links to the old bookmark URLs should still work, and the site should automatically redirect users to the new URL. If you find any links that return a page not found message, please [open an issue](https://github.com/questionlp/reports.wwdt.me/issues) on GitHub and provide the link you used.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20241102/reports-v3-shows-search-alert.png">
            <img src="/assets/images/waitwait/20241102/reports-v3-shows-search-alert.png" class="img-fluid border" alt="Warning message stating no panelists were selected for the Search Shows by Multiple Panelists report">
            </a>
            <figcaption class="figure-caption text-center">
                "No panelists were selected." warning message if no panelist was selected when submitting the "Search Shows by Multiple Panelists" report form
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20241102/reports-v3-shows-search-results.png">
            <img src="/assets/images/waitwait/20241102/reports-v3-shows-search-results.png" class="img-fluid border" alt="Generated results from the Search Shows by Multiple Panelists report">
            </a>
            <figcaption class="figure-caption text-center">
                Results from the "Search Show by Multiple Panelists" report
            </figcaption>
        </figure>
    </div>
</div>

For additional information on what has changed and new features included in version 3, check out the [release notes](https://github.com/questionlp/reports.wwdt.me/releases/tag/v3.0.0).

Source code for the Wait Wait Reports Site is [available on GitHub](https://github.com/questionlp/reports.wwdt.me) and published under the terms of the [Apache License 2.0](https://github.com/questionlp/reports.wwdt.me/blob/main/LICENSE).
