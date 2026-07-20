---
layout: post
title:  "Omnibus Update: July 2026 Edition"
date:   2026-07-19 21:30:00 -0700
tags:   waitwait ev subaru trailseeker update
---

There have been a couple of things going on and projects that I've worked on since I published
the [last update post in April]({{ site.url }}{% post_url 2026-04-30-omnibus-update-april-2026-edition %}), so I guess it's time for another omnibus update!

### Table of Contents

<div class="row ms-2">
    <div class="col col-lg-6">
        <ul>
            <li><a href="#wait-wait-playing-cards-gallery">Wait Wait Playing Cards Gallery</a></li>
            <li><a href="#wait-wait-stats-project-updates">Wait Wait Stats Project Updates</a></li>
            <li><a href="#migration-to-codeberg-continues">Migration to Codeberg Continues</a></li>
            <li><a href="#subaru-trailseeker-update">Subaru Trailseeker Update</a></li>
        </ul>
    </div>
</div>

### Wait Wait Playing Cards Gallery

In November 2024, I was browsing around for various [Wait Wait... Don't Tell Me!](https://waitwait.npr.org/) trinkets and found two packs of playing cards available from two different sellers on eBay. I quickly ordered both of them and they have been sitting next to my desk pretty much ever since.

Although I noticed that box each pack came in had some differences, including the wording and the colors (or lack thereof) of the sample card adhered on the outside, I never fully looked through both packs until two weeks ago. That is when I noticed that the back of each card in one pack was printed with colors and the other without. At that point, I started a spreadsheet cataloging the name and description printed on each card.

The second pack of cards, the one where the back was printed without color, had newer panelists such as Paula Poundstone and Mo Rocca. That places the absolute earliest design and print date for the newer pack to be January 2002, when Mo Rocca debuted as a panelist. To date, I haven't determined when the earliest design and print date for the first pack would be. That would require matching up names with the history of their titles at NPR or NPR-affiliate stations.

Since the only other place where I've seen folks post photos of a selection of the playing cards was a [Reddit post from three years ago](https://www.reddit.com/r/NPR/comments/11phjxn/front_a_long_ago_pledge_drive_the_wait_wait_dont/). That gave me the idea to scan the cards and create an online gallery.

The first step was to scan all 108 cards (52 suit cards plus two jokers per pack) on my multi-function HP Color LaserJet MFP M277 in batches as PNG files at 1200 DPI (dot per inch). The first batch of scans were done using the GNOME Document Scanner program on my Framework Laptop 16 running Fedora Workstation 44. Unfortunately, the multi-function printer stopped sending over scans at 1200 DPI after I had powered off and back on the printer. I switched over to scanning the cards in Adobe Photoshop on my M1 Max MacBook Pro.

Once all of the cards had been scanned (and a majority re-scanned for a number of reasons) and converted to use the sRGB color space, I exported out each card individually. I used the content-aware Spot Healing Brush to remove any dust and lint that was on the scanning bed. I avoided touching anything within the drawings, so there are a couple of cards with small bits visible when zoomed in all the way.

For the gallery, I created a quick mock-up using [Bootstrap](https://getbootstrap.com/), the same web design framework that I use for the Wait Wait Stats Project, and played around with a design that I liked. Instead of having to manually add 108 cards, I took the information I entered into the spreadsheet and got them into a JSON file.

I thought about using a static site generator tool to create website for the gallery, but I opted to make it a Python web application using [Flask](https://flask.palletsprojects.com/). This way, if I end up getting packs with different cards in the future, I can just scan the cards, add entries to the JSON file and publish them with relative ease.

The [Wait Wait Playing Card Gallery](https://cards.wwdt.me/) is now live for anyone and everyone to browse.

I have made the source code for the application and the scaled-down card images available on [Codeberg](https://codeberg.org/qlp/cards.wwdt.me). The application code is published under an [Apache License 2.0](https://codeberg.org/qlp/cards.wwdt.me/src/commit/7b0633a0308f76c079991d3c1599ae17ee8e6709/LICENSE-APACHE) while the card images are published under a [Creative Commons BY-NC-SA 4.0 license](https://creativecommons.org/licenses/by-nc-sa/4.0/).

### Wait Wait Stats Project Updates

The [Wait Wait Stats Page](https://stats.wwdt.me/), [Stats API](https://api.wwdt.me), and [Graphs Site](https://graphs.wwdt.me/) saw releases around mid-June with upgrades to version 3 of the [Wait Wait Stats Library](https://docs.wwdt.me/) and general code cleanup work. The applications also received some bugfixes and the Stats Page can handle having more than one Scorekeeper Emertii via a configuration setting.

Along with the those three, the [Wait Wait Reports Site](https://reports.wwdt.me/) also get an update where the displaying of decimal values are now rounded to six digits rather than four or five. It's a very minor update, but one that was afforded by the updates to the Wait Wait Stats Library.

Changelogs and release notes are linked below:

* [api.wwdt.me](https://codeberg.org/qlp/api.wwdt.me/src/branch/main/CHANGELOG.md)
* [graphs.wwdt.me](https://codeberg.org/qlp/graphs.wwdt.me/src/branch/main/CHANGELOG.md)
* [reports.wwdt.me](https://codeberg.org/qlp/reports.wwdt.me/src/branch/main/CHANGELOG.md)
* [stats.wwdt.me](https://codeberg.org/qlp/stats.wwdt.me/src/branch/main/CHANGELOG.md)
* [wwdtm](https://docs.wwdt.me/latest/changes/index.html)

### Migration to Codeberg Continues

Since the last update, I have continued to migrate my Git repositories from GitHub to Codeberg, including the major repositories for the Wait Wait Stats Project. As with the other repositories that now have their primary home on Codeberg, the migrated repositories still automatically mirror changes over to GitHub, but releases are not mirrored and need to be manually created on GitHub.

For the Wait Wait Playing Card Gallery project, it was published first on Codeberg, then mirrored to GitHub. I will not be creating releases for the project on GitHub since I just want it to be a simple mirror at this point.

### Subaru Trailseeker Update

As I write this, it has been almost three months since I got the keys to my 2026 Subaru Trailseeker, named Astrid. Since then, I have taken it on a couple of day trips, [one to Mima Mounds Natural Area Preserve]({{ site.url }}{% post_url 2026-05-27-first-day-trip-in-my-subaru-trailseeker %}) and one down to visit museums in Corvallis and Philomath Oregon. For the most part, owning and driving the Trailseeker has been fun and generally uneventful.

In early May, I came down to the Trailseeker only to find that the 12-Volt accessory battery was running really low, even though the car had been locked and fully powered off since I had last driving a couple of days before. There was enough juice in the 12-Volt battery to unlock the car with my key fob and attempt to start the car. That's when the 12-Volt battery flatlined. I called Subaru Roadside Assistance to get the battery jump-started and I was able to go run errands.

The next day, I had my Subaru Love Encore appointment at the dealer and called the service department ahead of time to see if they could look at the 12-Volt battery. They ran the battery through some quick tests, but it seemed to be at the expected voltage and capacity after it was jump-started and charged while driving the car around.

The service department booked me an appointment a couple of days later so that they could run some longer tests on the battery and see if there was a parasitic drain, which they didn't find any.

One thing that I had noticed before the incident was seeing a "Low Bettery" message in the instrument panel while the car was in the My Room mode to run the air conditioner while plugged into a DC fast charger. I turned the car off, let the charging session finish, and went on my way. The Trailseeker didn't warn about the low battery for some time.

Well, that is until about three weeks ago while also charging the car at a DC fast charger and using the My Room mode to keep the inside of the car cool on a 90 degrees F (32.2 degrees C). I did the same thing as last time: turned the car off, let the charging session finish, and drive back home without seeing another warning.

A couple of days later, I went down to the car to head to an appointment and found that the 12-Volt battery had been so depleted that I couldn't unlock the car with the key fob. I used the physical key stowed in the key fob to open the driver-side door and no lights or screens came on. I tried to jump-start the battery with my jump-start kit I bought, but the jump-starter's battery had also drained too low to be useful ([Isn't it ironic, don't you think?](https://www.youtube.com/watch?v=Jne9t8sHpUc)). So, another call to the Subaru Roadside Assistance to get the car jump-started and, once it was, I immediately called the dealer's service department explaining what had happened and headed over there.

Since I had joined the [r/trailseeker](https://www.reddit.com/r/trailseeker/) sub-Reddit, I saw quite a few posts about other folks experiencing the same issue, including [this megathread](https://www.reddit.com/r/trailseeker/comments/1uqyn1c/12v_parasitic_drain_megathread/). The main culprit seems to be centered around the DCM (digital communications module) waking up and trying to do telematics push-pull tasks too often or something is causing it to loop. Another possible symptom folks saw was the infrared LEDs on the steering column flashing incessantly even when they turned the car off or in accessory mode.

Folks in the sub-Reddit have mitigated the problem by replacing the OEM battery with an AGM (absorbed glass-mat) battery that can withstand the parasitic drains better. Other folks have attached battery monitors and tenders to monitor and keep the 12-Volt battery from depleting. The latter isn't an option where I park at home.

I related all of that information to the service manager who greeted me when I arrived. They said that they hadn't had any reported cases from other Trailseeker, Solterra or Uncharted owners, but would start contacting other folks. While I was waiting for a loaner vehicle, the service manager said that one of the regional service folks had a vehicle in with the same problem. I explained that I want them to figure out what's causing the phantom drains and work with Subaru to figure out a solution, since it would be absolutely unacceptable to have it happen again.

They will have had the car for two weeks tomorrow, as I write this, with Subaru saying that they should replace the 12-Volt battery. The service advisor that I'm working with is skeptical that it will resolve the problem, since it's a parasitic drain rather than a dud 12-Volt battery. They said that is what Subaru is requiring before moving forward. They will keep the vehicle until the new battery arrives and they can continue to check for parasitic drains after that.

I am quite frustrated with the situation and I do not fault the service folks. The blame goes to both Subaru and Toyota since there is something with their systems causing the problem and they don't seem to be very proactive or even actively working with folks experiencing this issue.

I will report back once there has been progress on the situation.
