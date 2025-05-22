---
layout: post
title:  "Welcome to the New linhpham.org Site and Blog"
date: 2025-04-01 21:05 -0700
tags: update website blog
---

For the past couple of years, I had two personal websites: [linhpham.org](https://linhpham.org) that acted as a landing page with some information about myself and my projects presented as hero blocks, and [blog.linh.social](https://blog.linh.social) that was my blog. I didn't like the idea of having to maintain two different sites and didn't like having to post links to each one.

### 2 (Sites) Become 1

Today, I am re-lauching **linhpham.org** to combine those two sites under one domain. The home page for this site is still designed as a quick introduction about myself with several hero blocks, while incorporating the blog from **blog.linh.social**.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/linhpham.org/landing-page-old.png">
            <img src="/assets/images/linhpham.org/landing-page-old.png" class="img-fluid border" alt="Previous landing page for linhpham.org">
            </a>
            <figcaption class="figure-caption text-center">
                Landing page from the previous version of the site
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/linhpham.org/landing-page-new.png">
            <img src="/assets/images/linhpham.org/landing-page-new.png" class="img-fluid border" alt="New landing page for linhpham.org">
            </a>
            <figcaption class="figure-caption text-center">
                Landing page for the new version of the site
            </figcaption>
        </figure>
    </div>
</div>

Previously, **linhpham.org** was a static site, with two pages, built using the Bulma frontend toolkit while **blog.linh.social** is built using [Jekyll](https://jekyllrb.com/) and a custom theme that I created called [termina-plex]({{ site.url }}{% post_url 2024-03-24-announcing-termina-plex-theme-jekyll %}). The new site is built using Jekyll, but uses [Bootstrap](https://getbootstrap.com/) as the frontend toolkit with influences from the same [IBM Design Language](https://www.ibm.com/design/language/) that also influenced the design of the [Wait Wait Stats Page](http://stats.wwdt.me) and related sites.

I also incorporated some of the learnings from building the [Hey Gurgle]({{ site.url }}{% post_url 2025-03-16-launching-hey-gurgle-search-engine %}) website using Bootstrap, including using helper classes more often for defining component margins, padding and sizing. There are still some custom CSS and variable tweaking needed behind the scenes, but not to the same degree as the Wait Wait Stats Project sites.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/linhpham.org/projects-hero-old.png">
            <img src="/assets/images/linhpham.org/projects-hero-old.png" class="img-fluid border" alt="Previous Projects hero section">
            </a>
            <figcaption class="figure-caption text-center">
                Projects hero section from the previous version of the site
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/linhpham.org/projects-hero-new.png">
            <img src="/assets/images/linhpham.org/projects-hero-new.png" class="img-fluid border" alt="New Projects hero section">
            </a>
            <figcaption class="figure-caption text-center">
                A simpler Projects hero section for the new version of the site
            </figcaption>
        </figure>
    </div>
</div>

While I was planning out the URL structure for the new site, I wanted all of the blog-related paths to be prefixed with `/blog` and simplify the URL for each posts by removing the month and day components. Existing **blog.linh.social** blog post links will be redirected to the new URL structure at the web server level.

Previously, I used a couple of include files to iterate through and generate the tag and category pages. It did not generate index pages for each year and had some other limitations. The new site uses the [jekyll-archives](https://github.com/jekyll/jekyll-archives/) plugin to solve those gaps, but I still needed to create my own tag index page. Archive pages no longer display an excerpt from each post and pagination is no longer used in blog post listings.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/linhpham.org/blog-post-old.png">
            <img src="/assets/images/linhpham.org/blog-post-old.png" class="img-fluid border" alt="Blog post from the previous version">
            </a>
            <figcaption class="figure-caption text-center">
                Example of a blog post from the previous version of the site
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/linhpham.org/blog-post-new.png">
            <img src="/assets/images/linhpham.org/blog-post-new.png" class="img-fluid border" alt="Blog post from the new version">
            </a>
            <figcaption class="figure-caption text-center">
                Example of a blog post from the new version of the site with a simplified look
            </figcaption>
        </figure>
    </div>
</div>

### Design Talk

Although the new version of the site eschews the terminal-inspired design of the old **blog.linh.social** site, the brand in the top navigation bar hints at the site's past. The new site includes and uses both the sans-serif and monospace versions of the [IBM Plex](https://www.ibm.com/plex/) font family, though the monospace version is now reserved for code blocks and inline snippets.

For the post metadata, I took inspiration from the [Fluida](https://wordpress.org/themes/fluida/) WordPress theme and used red icons next to the date and time and the list of tags.

Hosting of all of the required web fonts, icons, scripts and other required assets are hosted on the web server and do not depend on any third-party services. And, as with all of the other sites that I have, I use [Umami Analytics](https://umami.is/) for general web analytics and use my own instance of the Umami web application.

### Closing Notes

There are probably a few rough edges that I'll need to work on in terms of usability on devices with smaller screens and improve how the pages look when printed.

All blog posts are now licensed under Creative Commons Attribution-ShareAlike 4.0 International (aka [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)), unless otherwise stated.

Additional information on the licenses the assets are distributed under is available in the [README.md](https://github.com/questionlp/linhpham.org_jekyll/blob/main/README.md) for this site's code repository.
