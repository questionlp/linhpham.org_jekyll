---
layout: post
title:  "Wait Wait Stats Updates: July 2025"
date:   2025-07-01 21:00:00 -0700
tags:   waitwait update
---

In the past month, I have been working on a couple of updates for the Wait Wait Stats Project sites and the infrastructure that hosts the sites. I will be covering those updates and changes in this blog post.

## Update on the Server Infrastructure Changes

Towards the end of the previous [Wait Wait Stats Updates blog post]({{ site.url }}{% post_url 2025-05-25-wait-wait-stats-update-may-2025 %}) published in May, I mentioned that I would be making changes to how the Wait Wait Stats Project sites are hosted and served.

For a while, I had been hosting the sites through Cloudflare as a means to protect the site from potential attacks, but also create rules to limit or block bots and scrapers from taking a toll on the web servers. I made the decision to move away from Cloudflare for a couple of reasons, including: reducing overall hosting costs and reducing the number of third-party services required for hosting.

In order to reduce the impact of removing Cloudflare from being a web application firewall, I decided to stand up a new server that acts as a load balancing reverse proxy in front of the two existing web application servers. The new server will also be caching the request results and media files to further reduce the amount of traffic directly hitting the two servers.

Keeping with the naming convention based on folks from [Wait Wait Don't Tell Me!](https://waitwait.npr.org/), the new server is named after the current Technical Director of the show, Lorna White. The name was chosen as a very specific reference based on the "Techinical Director" title in which Cisco used to sell a web load balancer appliance called "LocalDirector". The name of the two web application servers are `bill` and `korva`, named after judge and scorekeepers Bill Kurtis and Korva Coleman. Both also host a copy of the [Wait Wait Stats Database](https://github.com/questionlp/wwdtm_database), with `bill` being the source and `korva` being a replica.

I also resized the smaller of the two web application servers (`korva`) to match the size of `bill` and configured both servers to serve all of the Stats Project sites. Previously, `bill` had been primarily hosting the [Stats Page](https://stats.wwdt.me/) and [Stats API](http://api.wwdt.me/) while `korva` primarily handled hosting the [Graphs](https://graphs.wwdt.me/) and Reports Sites. This change was primarily made to keep the load balancing setup more, er, balanced and provided a little bit more redundancy.

Eventually, I will need to extend that redundancy to the load balancer setup.

## Wait Wait Reports Site

The night that I am writing this blog post, I just published version 4.0.0 of the [Wait Wait Reports Site](https://reports.wwdt.me/), which has includes a couple of new and updated reports, and a significant behind-the-scenes change.

First up, the "Not My Job vs Bluff the Listener Win Ratios" report has been renamed to "[Not My Job vs Bluff the Listener Win Ratios by Year](https://reports.wwdt.me/shows/not-my-job-guests-vs-bluff-the-listener-win-ratios)" and now includes a breakdown of win ratios by year along with the aggregate win ratios.

I also created a Panelists "[First Appearances](https://reports.wwdt.me/panelists/first-appearances)" and a Panelists "[First Wins](https://reports.wwdt.me/panelists/first-wins)" reports. The new "First Apperances" report lists the first time a panelist has appeared on the show and how they performed on the show. By default, the report sorts the list by panelist name, but there is an option to sort the list by show date. The report provides additional information that isn't included in the "First and Most Recent Appearances" report.

The new "First Wins" report lists the first time each panelist has won Lightning Fill-in-the-Blank outright by finishing in first place, or had their first overall win by coming in either first or tied for first. Panelists who have not yet win outright and have not yet had an overall win are not listed.

The Panelists "[Appearance Counts by Year](https://reports.wwdt.me/panelists/appearance-counts-by-year)" report now includes Best Of, Repeat and Repeat Best Of columns and the Panelists "[Single Appearance](https://reports.wwdt.me/panelists/single-appearance)" report now includes Start and Correct columns.

For the Locations "[Recording Counts by Year](https://reports.wwdt.me/locations/recording-counts-by-year)" report, I removed the year dropdown and submit button and converted the report to list the counts for all years, then used Bootstrap's accordion component to show the results for a specific year.

Instead of having an ascending or descending sort option above the table in the "[All Shows](https://reports.wwdt.me/shows/all-shows)", "[Best Of Shows](https://reports.wwdt.me/shows/best-of-shows)", "[Original Shows](https://reports.wwdt.me/shows/original-shows)", "[Repeat Best Of Shows](https://reports.wwdt.me/shows/repeat-best-of-shows)" and "[Repeat Shows](https://reports.wwdt.me/shows/repeat-shows)" reports, the "Date" column can now be clicked on to change the sort order.

Lastly, the behind-the-scenes change to the Reports Site is that the application now requires version 4.7 of the Wait Wait Stats Database, uses the decimal panelist score columns from the database to pull data from and run calculations. This is was the first major test of removing the use of the integer panelist score columns from any of the Stats Project applications.

For the time being, I don't plan on making the same changes to the Wait Wait Stats Library, along with the Stats API, Graphs Site and Stats Page. Doing so would be a major breaking change and require a lot more work and testing.

Additional information on the changes that I haven't covered in this blog post can be found in the [changelog](https://github.com/questionlp/reports.wwdt.me/blob/main/CHANGELOG.md) available in the [reports.wwdt.me](https://github.com/questionlp/reports.wwdt.me) repository.

## Wait Wait Stats Page

While the updates to the [Wait Wait Stats Page](https://stats.wwdt.me/) are not as extensive as the Reports Site, the site has received a couple of fixes and updates. The larger change to the site is the additional of the "[Understanding Wait Wait Stats Page Data](https://stats.wwdt.me/understanding-data)" page and changes to some of the templates to support the new page.

"Understanding Wait Wait Stats Page" describes the data that is presented in the different section of each Not My Job Guest, Host, Location, Panelist, Scorekeeper and Show. The new page is a successor to the "Help" page that was available in version 3 of the Stats Page, but was removed from version 4.

Each section of the page has a corresponding live information block that pulls data from the database when the page is rendered. This not only gives a better representation of the data being described since it would be updated as new data is entered or updated, but it is a lot more accessible than using a screenshot.

In order to include the corresponding information blocks on the page, the corresponding templates needed to be updated to allow some sections to be excluded from the rendered information block (such as list of appearances, show descriptions and show notes). This does not change how the information blocks are rendered in their normal form, but it allows a less cluttered page.

For additional information on the changes included in version 6.7.0 of the Stats Page can be found in the [changelog](https://github.com/questionlp/stats.wwdt.me/blob/main/CHANGELOG.md) available in the [stats.wwdt.me](https://github.com/questionlp/stats.wwdt.me/) repository.

## Filling in the "Multiple" Panelist Blanks

There are a handful of Best Of and Repeat Best Of shows that I hadn't been able to determine each panelist who made an appearance in the segments included in those shows. I created a "Multiple" placeholder panelist in the Stats Database and entered that has the sole panelist for those shows.

Some of the hurdles for collecting that information in the past included the lack of access to the audio from earlier shows, the lack of transcripts for shows in the 2000s and early 2010s, and inaccuracies in segment descriptions for both the Best Of shows and for the original shows those segments came from.

Now that I have access to almost every show from 1998 through the most recent show, I have started the task of listening through those Best Of shows to collect and enter in the panelists who appeared in those segments. I am also included a few additional notes as I run into any interesting information from those shows, including guest hosts and scorekeepers.

## Wrapping Up

Flickr [recently announced](https://blog.flickr.net/en/2025/06/18/creative-commons-4-0-has-arrived-on-flickr/) that they added support for version 4.0 of the [Creative Commons](https://creativecommons.org/) licenses and added the ability to bulk update photos to use the new license. Up until then, I had been uploading photos of the notes I take for each Wait Wait Don't Tell Me! that I listen to up on Flickr and licensed them under [Creative Commons Attribution-NonCommercial-ShareAlike 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/). With the ability to bulk update photos, all of the photos are now under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). The photos are added to the [Wait Wait Don't Tell Me! Notes](https://www.flickr.com/photos/questionlp/albums/72157718939162790/) album and are ordered from oldest to newest.

Once I finish filling in the "Multiple" panelist blanks in the data, I'm not sure what new features, reports or updates will come to the Wait Wait Stats Project sites. I will most likely focus on listening through the shows from 2000 and onwards, as well as updating the show descriptions to use the new format I have been using for the 1998, 1999 and recent shows.
