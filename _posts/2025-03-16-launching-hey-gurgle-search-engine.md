---
layout: post
title:  "Launching the Hey Gurgle Search Engine"
date: 2025-03-16 20:05 -0700
tags: tbtl marsupial-gurgle python
---

Today, I am officially launching a search engine for the [Marsupial Gurgle](https://marsupialgurgle.com/) audio archive called "**[Hey Gurgle](http://search.marsupialgurgle.com/)**".

### Background Dazzling Deets

Most people know me as the "Wait Wait Stats Person" where I created and maintain the [Wait Wait Stats Page](https://stats.wwdt.me/) along with the other Wait Wait Stats Project related sites. In addition to being the "Wait Wait Stats Person", I am also a [TBTL](https://tbtl.net/) Ten. Over ten years ago, I started to pull clips of the show's co-hosts, [Luke Burbank](https://bsky.app/profile/lukeburbank.bsky.social) and [Andrew Walsh](https://bsky.app/profile/walsh.bsky.social), saying funny things or audio drops that were used on the podcast. The clips were initially uploaded a small portion of my website, but as the collection of clips and drops grew, I created a WordPress blog called "Marsupial Gurgle" and migrated the clips over.

Each episode would have its own blog post when a catalog of clips that I pulled and uploaded, along with links to the MP3, MPEG-4 and MPEG-4 ringtone versions of each clip. The clips were uploaded, using a Python script, to Amazon AWS S3 cloud storage and served through AWS CloudFront to reduce overall costs. Instead of uploading the clips using the naming convention that I used locally, I uploaded the files with different names to remove spaces and special characters in a flat directory structure. That decision still haunts me to this day.

Due to the site structure, searching for individual clips using the WordPress search feature was sub-optimal, as it would return any blog posts that matched the search query. I knew this was something that I would need to address, but I didn't know how to tackle such a project and the search results grew less and less useful as the number of blog posts climbed into the thousands.

Even though I decided to step down from pulling and uploading clips for each episode several years ago, I still wanted to figure out the search issue.

### Building the Search Engine

Last month, I started to look at ways to reduce my Amazon footprint and decided to migrate all of the clips to instances hosted on two different virtual private server (VPS) providers. While planning the migration, I also decided to create a [Python script](https://github.com/questionlp/) that would parse through each audio file and catalog their S3 path, filename stem, suffix and audio tag metadata, storing the resulting data into a MySQL database. This would allow me to use the full-text search feature included in MySQL Server to query for specific words or phrases. At that point, I knew that I had to create a search engine of sorts.

I decided to use the experience of building web applications in Python and using Bootstrap as a frontend toolkit to create a basic search engine. The search engine supports the use of MySQL's full-text natural language or boolean search mode, with the default being natural language mode.

Between creating a proof-of-concept of the home page and the search results and having a nearly full-functioning application took a total of about 30 hours, plus another 5 or so hours testing, validating results, and troubleshooting errors that would come up.

As far as the frontend design, I wanted an homage to Google's search home page and results page from years ago, before the introduction of AI and general enshittification of everything. Plus, the name Google would also play into the name of my newly created search engine.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/hey-gurgle/home-page.png">
            <img src="/assets/images/hey-gurgle/home-page.png" class="img-fluid border" alt="Home page for the Hey Gurgle audio clip search site in light mode">
            </a>
            <figcaption class="figure-caption text-center">
                Home page for the Hey Gurgle audio clip search engine with a search field, in light mode
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/hey-gurgle/home-page-dark.png">
            <img src="/assets/images/hey-gurgle/home-page-dark.png" class="img-fluid border" alt="Home page for the Hey Gurgle audio clip search site in dark mode">
            </a>
            <figcaption class="figure-caption text-center">
                Home page for the Hey Gurgle audio clip search engine with a search field, in dark mode
            </figcaption>
        </figure>
    </div>
</div>

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/hey-gurgle/search-results-hey-gorgle.png">
            <img src="/assets/images/hey-gurgle/search-results-hey-gorgle.png" class="img-fluid border" alt="Search results for '+hey +gorgle' with the boolean search mode">
            </a>
            <figcaption class="figure-caption text-center">
                Search results for "+hey +gorgle" with boolean search mode selected
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/hey-gurgle/search-results.png">
            <img src="/assets/images/hey-gurgle/search-results.png" class="img-fluid border" alt="Search results for 'linh pham' with the default natural language search mode">
            </a>
            <figcaption class="figure-caption text-center">
                Search results for "linh pham" with the default natural language search mode selected
            </figcaption>
        </figure>
    </div>
</div>

Each of the search results include a media player control for each audio clip, a "Clip Info" button that displays additional metadata, and download buttons for each of the available audio formats.

### "Hey, Gurgle!"

The decision to name the new search engine **Hey Gurgle** was a very quick and easy decision. The name is a play on both the name of the "Marsupial Gurgle" site and a spoof that had been made quite a few times by Luke and Andrew, "Hey, Gorgle!". The phrase "Hey, Gorgle!" came from they play on the "Hey, Google!" activation phrase for Google's home assistant and "Gorgle" is just one letter away from "Gurgle".

I also registered the domains [heygurgle.com](https://heygurgle.com/) and [heygorgle.com](https://heygorgle.com/) and both will redirect to the **Hey Gurgle** site, once the new domain registration and DNS changes have propagated.

### Wrapping Up

Both the [Hey Gurgle](https://search.marsupialgurgle.com/) search engine and all of the audio clips are hosted outside of Amazon AWS and the corresponding S3 buckets and CloudFront distributions will be removed in a few days, just to make sure that DNS changes have propagated.

If you would like to learn about the differences in the aforementioned natural language and boolean search modes, the site's [help page](https://search.marsupialgurgle.com/help) provides some of those details.

The source code for both the Python [audio clip parsing script](https://github.com/questionlp/marsupialgurgle-audio-parsing) and the [Hey Gurgle web application](https://github.com/questionlp/search.marsupialgurgle.com) are available on GitHub and are both licensed under the terms of the MIT License.
