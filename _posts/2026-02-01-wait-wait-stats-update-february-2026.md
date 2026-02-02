---
layout: post
title:  "Wait Wait Stats Updates: February 2026"
date:   2026-02-01 16:00:00 -0800
tags:   stats waitwait update
---

Over the past couple of weeks, I have been working on two sets of updates to the Wait Wait Stats Project, one that's visible and one that isn't so visible.

### Higher Contrast Dark Theme

In October 2025, I updated the dark color theme for the Wait Wait Stats Project to reduce contrast between the page background and the body text color based on feedback that I had received, due to very high contrast can worsen legibility and cause additional eye strain.

Since that change, I started to toy around with the idea of creating a new dark color theme that provides an option for a higher contrast dark theme for those who prefer or need the extra contrast to be able to read the content on the sites.

Version 2.5.1 of the [Wait Wait Stats Project Bootstrap](https://github.com/questionlp/wwdtm-theme) package, a new `dark-contrast` theme where black is used as the background color and IBM Gray 10 (`#f4f4f4`) is used for the standard text color.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20260201/stats-page-dark.png">
            <img src="/assets/images/waitwait/20260201/stats-page-dark.png" class="img-fluid border" alt="The landing page for the Wait Wait Stats Page rendered using the standard dark theme with a darker gray background and light gray text">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Stats Page: Dark Theme
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20260201/stats-page-dark-high-contrast.png">
            <img src="/assets/images/waitwait/20260201/stats-page-dark-high-contrast.png" class="img-fluid border" alt="The landing page for the Wait Wait Stats Page rendered using the higher contrast dark theme with a black background and very light gray text">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Stats Page: Higher Contrast Dark Theme
            </figcaption>
        </figure>
    </div>
</div>

For the [Wait Wait Stats Page](https://stats.wwdt.me/), [Wait Wait Graphs Site](https://graphs.wwdt.me/) and the [Wait Wait Reports Site](https://reports.wwdt.me/), there is a new "Dark Contrast" theme available in the theme selection dropdown. When choosing a color theme other than "Auto", the site will store the chosen color theme in the browser's LocalStorage for each site. None of the sites use cookies for tracking or storing user preference.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20260201/graphs-site-dark.png">
            <img src="/assets/images/waitwait/20260201/graphs-site-dark.png" class="img-fluid border" alt="The landing page for the Wait Wait Graphs Site rendered using the standard dark theme with a darker gray background and light gray text">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Graphs Site: Dark Theme
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20260201/graphs-site-dark-high-contrast.png">
            <img src="/assets/images/waitwait/20260201/graphs-site-dark-high-contrast.png" class="img-fluid border" alt="The landing page for the Wait Wait Graphs Site rendered using the higher contrast dark theme with a black background and very light gray text">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Graphs Site: Higher Contrast Dark Theme
            </figcaption>
        </figure>
    </div>
</div>

The only caveat with the new theme is that the plot and graph colors rendered use the standard dark theme colorways and colorscales. This was done due to the use of black to represent either null data or minimum values in various charts.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20260201/reports-site-dark.png">
            <img src="/assets/images/waitwait/20260201/reports-site-dark.png" class="img-fluid border" alt="The landing page for the Wait Wait Reports Site rendered using the standard dark theme with a darker gray background and light gray text">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Reports Site: Dark Theme
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/20260201/reports-site-dark-high-contrast.png">
            <img src="/assets/images/waitwait/20260201/reports-site-dark-high-contrast.png" class="img-fluid border" alt="The landing page for the Wait Wait Reports Site rendered using the higher contrast dark theme with a black background and very light gray text">
            </a>
            <figcaption class="figure-caption text-center">
                Wait Wait Reports Site: Higher Contrast Dark Theme
            </figcaption>
        </figure>
    </div>
</div>

The latest version of the Wait Wait Reports Site also fixes the issue of tooltips not appearing when certain labels or fields are hovered over. This was due to the location of the Bootstrap JavaScript initialization code.

### Dependency Updates and Inching Towards Python 3.14 Support

Along with the new higher contrast dark theme being rolled out, I also took the opportunity to update the various Python library dependencies for the [Wait Wait Stats Library](https://docs.wwdt.me/), along with the web applications that use it: [Wait Wait Stats API](https://api.wwdt.me/), [Wait Wait Stats Page](https://stats.wwdt.me/) and [Wait Wait Graphs Site](https://graphs.wwdt.me/). The dependencies for the [Wait Wait Reports Site](https://reports.wwdt.me/) web application were also updated, but the site does not use the Stats Library.

Bumping some of the major dependencies, including [MySQL Connector/Python](https://dev.mysql.com/doc/connector-python/en/), [NumPy](https://numpy.org/) and [gunicorn](https://gunicorn.org/), help lead to official support for Python 3.14. Right now, Python 3.13 is used in Production and full testing for Python 3.14 will start in the coming months.

I also updated the version of [Sphinx](https://www.sphinx-doc.org/) used to build the documentation for the Stats Library from 8.2.3 to 9.1.0. This should not have any visible impact on the generated [Stats Library documentation](https://docs.wwdt.me), but it was done to ensure Python 3.14 support.

### Changelogs and Release Notes

* [Wait Wait Graphs Site](https://github.com/questionlp/graphs.wwdt.me/blob/main/CHANGELOG.md)
* [Wait Wait Reports Site](https://github.com/questionlp/reports.wwdt.me/blob/main/CHANGELOG.md)
* [Wait Wait Stats API](https://github.com/questionlp/api.wwdt.me_v2/blob/main/CHANGELOG.md)
* [Wait Wait Stats Library](https://docs.wwdt.me/latest/changes/index.html)
* [Wait Wait Stats Page](https://github.com/questionlp/stats.wwdt.me/blob/main/CHANGELOG.md)
* [Wait Wait Stats Project Bootstrap](https://github.com/questionlp/wwdtm-theme/releases)
