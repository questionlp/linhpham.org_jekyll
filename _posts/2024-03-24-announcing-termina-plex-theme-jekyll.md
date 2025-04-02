---
layout: post
title:  "Announcing Termina Plex Theme for Jekyll"
date:   2024-03-24 19:50:00 -0800
tags:   jekyll theme web-design
---

Just a year ago (give or take a couple of months), I published a Jekyll theme named "Minima Plex." The theme extends the Minima theme and features the [IBM Plex](https://www.ibm.com/plex/) family of fonts.

Although the theme has served me and this blog well, I started experimenting with migrating away from Jekyll to a different static site generator (including [11ty](https://www.11ty.dev), [Pelican](https://getpelican.com), and [Hugo](https://gohugo.io)). One of the themes I ran across for Hugo was [Nightfall](https://github.com/LordMathis/hugo-theme-nightfall/). I liked the minimal design, which took some inspiration from Unix and Unix-like shells and terminals. While I liked the theme, I could not say the same for Hugo.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/termina-plex/nightfall-theme.png">
    <img src="/assets/images/termina-plex/nightfall-theme.png" class="img-fluid border" alt="Nightfall Hugo theme demo site">
    </a>
    <figcaption class="figure-caption text-center">
        Landing page for the Nightfall Hugo theme demo site
    </figcaption>
</figure>

After spending some time with 11ty and Pelican, I decided to stick with Jekyll for my blog and searched for themes with the same look and feel as Nightfall. Several themes were close enough, but they required heavier frameworks or a lot of tweaking to look how I wanted them. That is when I decided to port the Nightfall theme over to Jekyll.

When creating the new theme, I decided on "Termina Plex" as a reference to Unix/Unix-like terminals and the IBM Plex typeface, a big part of the theme's design.

To start the porting process, I cloned the Minima and Nightfall repositories. Once the repositories were cloned, I copied over the Sass CSS files from Nightfall and copied in the IBM Plex web font files for the Mono, Sans, and Serif variants. Retrofitting and extending the Minima layout files to make the core design look like Nightfall's took some work.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/termina-plex/termina-plex-01-landing-page-dark.png">
            <img src="/assets/images/termina-plex/termina-plex-01-landing-page-dark.png" class="img-fluid border" alt="Home page of the Termina Plex theme demo site in dark mode">
            </a>
            <figcaption class="figure-caption text-center">
                Termina Plex theme demo site showing the home page in dark mode
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/termina-plex/termina-plex-02-landing-page-light.png">
            <img src="/assets/images/termina-plex/termina-plex-02-landing-page-light.png" class="img-fluid border" alt="Home page of the Termina Plex theme demo site in light mode">
            </a>
            <figcaption class="figure-caption text-center">
                Termina Plex theme demo site showing the home page in light mode
            </figcaption>
        </figure>
    </div>
</div>

One of the features of Nightfall that I decided to keep was a minimal landing page as the home page and a separate page listing the published blog posts. A feature I added that Nightfall and Minima should have included were links to previous and next blog posts that are commonly found in other blog software.

Instead of using Minima's different skins to handle color schemes, I created light and dark mode themes that inspire IBM's [Carbon design language](https://carbondesignsystem.com). Since I'm already going heavy with IBM Plex, adopting some minimalist Carbon design language, including grays, blues, and purples, made sense.

By default, the theme uses the `prefers-color-scheme` CSS feature to select the user's preferred mode. I added a toggle in the navigation bar, allowing users to toggle between light and dark modes. The toggle saves that preference in the Local Storage via the Web Storage APIs.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/termina-plex/termina-plex-03-blog-post-listing-dark.png">
            <img src="/assets/images/termina-plex/termina-plex-03-blog-post-listing-dark.png" class="img-fluid border" alt="Blog post listing from the Termina Plex theme demo site in dark mode">
            </a>
            <figcaption class="figure-caption text-center">
                Termina Plex theme demo site showing a listing of blog posts in dark mode
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/termina-plex/termina-plex-04-blog-post-listing-light.png">
            <img src="/assets/images/termina-plex/termina-plex-04-blog-post-listing-light.png" class="img-fluid border" alt="Blog post listing from the Termina Plex theme demo site in dark mode">
            </a>
            <figcaption class="figure-caption text-center">
                Termina Plex theme demo site showing a listing of blog posts in light mode
            </figcaption>
        </figure>
    </div>
</div>

Another feature I ported from Nightfall was the post metadata block that displays the post author(s), published date, tags, and categories between the post's title and content. This is in contrast to Minima Plex, which listed the tags would be listed at the bottom of the page and did not display any category information.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/termina-plex/termina-plex-05-blog-post-dark.png">
            <img src="/assets/images/termina-plex/termina-plex-05-blog-post-dark.png" class="img-fluid border" alt="Blog post from the Termina Plex theme demo site in dark mode">
            </a>
            <figcaption class="figure-caption text-center">
                Termina Plex theme demo site showing an example blog posts in dark mode
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/termina-plex/termina-plex-06-blog-post-light.png">
            <img src="/assets/images/termina-plex/termina-plex-06-blog-post-light.png" class="img-fluid border" alt="Blog post from the Termina Plex theme demo site in light mode">
            </a>
            <figcaption class="figure-caption text-center">
                Termina Plex theme demo site showing an example blog posts in light mode
            </figcaption>
        </figure>
    </div>
</div>

The new theme also marks the first time I have published a package to [RubyGems](https://rubygems.org). To install the theme for your Jekyll installation from RubyGems, you can add the following to your blog's `Gemfile`:

```ruby
gem "termina-plex"
```

You can also install the theme from the [GitHub repository](https://github.com/questionlp/termina-plex) by adding the following:

```ruby
gem "termina-plex", git: "https://github.com/questionlp/termina-plex.git"
```

For information on using and configuring the theme, refer to the [`README.md` file](https://github.com/questionlp/termina-plex/blob/main/README.md) included in the repository.
