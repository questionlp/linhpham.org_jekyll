---
layout: base
title: Projects
---

### Wait Wait Stats Project

The Wait Wait Stats Project originally started in 2007 with the release of the first version of the Wait Wait Stats Page based on data that I started to collect from the NPR weekly quiz show, [Wait Wait... Don't Tell Me!](https://stats.wwdt.me).

Since then, the project has grown to include additional sites and an API to retrieve collected data and statistics from the Stats Database.

#### Wait Wait Stats Page

The Wait Wait Stats Page provides information for each Wait Wait show, including host, scorekeeper, panelists, Not My Job guest, scoring information, and additional notes.

Versions 1 and 2 were written in PHP and all of the information was presented on a single page, thus the moniker "Stats Page" was born. The version was a rebuild that used the [Silex](https://silex.symfony.com/) PHP MVC micro-framework and provided views for each host, scorekeeper, panelist, guest and show.

Another rebuild of the Stats Page came with version 4 with a migration from PHP to Python, along with creating a Python library that abstracts the retrieval of information from the Stats Database. The library would be crucial to the growth of the project to include the aforementioned Stats API. The application was built using the [Flask](https://flask.palletsprojects.com/) micro-framework.

Version 4 also brought along the Materialize frontend toolkit and version 6 would replace Materialize with the Bootstrap as the frontend toolkit.

* [stats.wwdt.me](https://stats.wwdt.me)
* [GitHub Repository: questionlp/stats.wwdt.me](https://github.com/questionlp/stats.wwdt.me)
* [Sponsor on GitHub](https://github.com/sponsors/questionlp)

### Wait Wait Stats Library

When I was starting to plan out version 4 of the Wait Wait Stats Page, I decided to split out the data retrieval and statistics calculation code from the Stats Page application and move it into a reusable library.

The result of that was the Wait Wait Stats Library written in Python and uses [NumPy](https://numpy.org/) for calculating panelist minimum, maximum, mean, and median scores, and standard deviation.

* [GitHub Repository: questionlp/wwdtm](https://github.com/questionlp/wwdtm)
* [Wait Wait Stats Library Documentation: docs.wwdt.me](https://docs.wwdt.me)

#### Wait Wait Stats API

Ever since I created the Wait Wait Stats Page, I received requests from folks
who were interested in the data that I collected over the years. As I was building out the Wait Wait Stats Library for version 4 of the Stats Page, I designed the returned data that can be used by both the Stats Page and an API.

The first version of the Stats API was built using Flask, but it lacked some of the OpenAPI support and helpers that [FastAPI](https://fastapi.tiangolo.com/) included. Version 2 of the API was migrated from Flask to FastAPI.

* [api.wwdt.me](https://api.wwdt.me)
* [GitHub Repository: questionlp/api.wwdt.me_v2](https://github.com/questionlp/api.wwdt.me_v2)

#### Wait Wait Reports

The Wait Wait Reports site provides detailed reports and search features that
provide information that went beyond the show information and panelist statistics included in the Stats Page.

The first version of the Reports site was built using Flask and used [Pure.css](https://pure-css.github.io/) CSS frontend toolkit. Version 2 would use the Bootstrap frontend toolkit, matching version 6 of the Stats Page.

* [reports.wwdt.me](https://reports.wwdt.me)
* [GitHub Repository: questionlp/reports.wwdt.me](https://github.com/questionlp/reports.wwdt.me)

#### Wait Wait Graphs

Starting in version 2 of the Wait Wait Stats Page, I added a scoring breakdown chart for each of the panelist. Version 3 would introduce an interactive version of the chart.

When building out version 4 of the Stats Page, I chose to not include any panelist charts. Instead, I opted to build a separate web application, the Wait Wait Graphs Site, using Flask, Materialize and [Chart.js](https://www.chartjs.org/) (later replaced by [Plotly.js](https://plotly.com/javascript/)). The Graphs Site introduced additional charts for each panelist and high-level charts for show level statistics.

Version 2 of the Graphs Site followed the footsteps of Stats Page version 6 by replacing Materialize with Bootstrap.

* [graphs.wwdt.me](https://graphs.wwdt.me)
* [GitHub Repository: questionlp/graphs.wwdt.me](https://github.com/questionlp/graphs.wwdt.me)

---

### Marsupial Gurgle

The Marsupial Gurgle website grew from a basic web page that had links to audio clips that I pulled from the daily podcast, "[TBTL: Too Beautiful to Live](https://tbtl.net)".

#### TBTL Audio Clip Archive

Marsupial Gurgle, a WordPress-powered site, hosts an archive of audio clips that have been pulled from thousands of TBTL episodes over the years. While listening through each episode of the podcast, I would mark and pull audio clips that I found interesting or funny. I also pulled clips and drops that listeners of the podcast, also known as the TBTL Tens, requested.

The site is named after an [audio phenomenon](https://marsupialgurgle.com/andrew-marsupial-gurgle-sound/) that happened on episode #1583 in 2014.

Hosting of the audio clips were originally hosted on Amazon AWS S3 and served through AWS CloudFront, but were recently moved to non-AWS cloud servers.

On July 1, 2022, I announced that I had stepped away from actively pulling and uploading audio clips to the site; but, I would still take special requests, time permitting, and still maintain the website.

* [marsupialgurgle.com](https://marsupialgurgle.com)

#### Hey Gurgle: Audio Clip Archive Search

Due to the way audio clips are organized and posted on Marsupial Gurgle, searching for individual audio clips has been a challenging experience since day one.

When I was planning to migrate the audio clips away from Amazon AWS, I made a local copy of the audio files, indexed all of the audio file metadata, and fed them into a MySQL database.

I created a web application built using Flask that can handle search requests and queries the MySQL database using full-text indexing.

The name "Hey Gurgle" is a reference to the "Marsupial Gurgle" name and a spoof that was made on the podcast in which the co-hosts would say "Hey Gorgle" as a means to avoid triggering Google home assistant devices.

* [Hey Gurgle](https://search.marsupialgurgle.com)

---

### Photography

Over the years, I have spent a fair amount of time behind the camera, taking photos at track days and other club events for the local chapter of the Audi Club, local car meets and events, and TBTL live events. I have also taken photos in and around Portland, Oregon; as well as, photos for previous social media ventures.

I have shot with various Nikon (D300, D500, D800E), Leica (M6 TTL and M9) and Sony (RX100) cameras.

* [Flickr](https://www.flickr.com/people/questionlp/)
