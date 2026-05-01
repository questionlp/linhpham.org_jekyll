---
layout: post
title:  "Omnibus Update: April 2026 Edition"
date:   2026-04-30 21:00:00 -0700
tags:   ev waitwait subaru tapings update
---

A whole lot of things have been happening in the past month, between Wait Wait-related and personal updates. Instead of spreading it out into multiple blog posts, I decided to kind of do a Lightning round/omnibus blog post briefly touching on each item.

### Wait Wait Taping on My Birthday

Before 2020 rolled around, I had a grand plan to celebrate my 40th birthday with a taping of Wait Wait Don't Tell Me in Chicago as my birthday landed on a Thursday (which is when they tape their shows). I made my plans with the folks at Wait Wait and had the opportunity to choose the panelists I would like to have on the show. My picks for the panel were: Faith Salie, Luke Burbank, and Mo Rocca. Unfortunately, because of things that happened in the first few months of 2020, the grand plan pretty much got scuppered, though Faith, Luke, and Mo were the panelists for the show that aired that weekend and I got a really nice birthday shout-out during the credits.

Fast foward to a week ago, I flew out to Chicago to celebrate my 46th birthday with a taping of Wait Wait at the Studebaker Theater. Although I didn't get a chance to see Peter Sagal, but I did get to say hello to Bill Kurtis before retiring as official judge and scorekeeper in May.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/chicago-2026/waitwait-stage-before-show-1600px.jpg">
            <img src="/assets/images/waitwait/chicago-2026/waitwait-stage-before-show-1280px.jpg" class="img-fluid border" alt="Wait Wait Don't Tell Me! on stage at the Studebaker Theater before the show">
            </a>
            <figcaption class="figure-caption text-center">
                Lecterns for Bill Kurtis and guest host Tom Papa, along with the panel table for Shantira Jackson, Katie Nolan, and Josh Gondelman
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/chicago-2026/waitwait-stage-start-show-1600px.jpg">
            <img src="/assets/images/waitwait/chicago-2026/waitwait-stage-start-show-1280px.jpg" class="img-fluid border" alt="Wait Wait Don't Tell Me! on stage at the Studebaker Theater with Bill Kurtis, Tom Papa, Shantira Jackson, Katie Nolan and Josh Gondelman">
            </a>
            <figcaption class="figure-caption text-center">
                Bill Kurtis, Tom Papa, Shantira Jackson, Katie Nolan, and Josh Gondelman ready to start the show
            </figcaption>
        </figure>
    </div>
</div>

I took notes during the taping of the show in order to compare and contrast with the edited version of the show that would be broadcasted or published on their podcast feeds.

<div class="row">
    <div class="col col-4 offset-1">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/chicago-2026/waitwait-notes-during-show-1600px.jpg">
            <img src="/assets/images/waitwait/chicago-2026/waitwait-notes-during-show-960px.jpg" class="img-fluid border" alt="Panelist, guest and scoring notes taken in a notebook during the show's taping">
            </a>
            <figcaption class="figure-caption text-center">
                Notes taken during the show
            </figcaption>
        </figure>
    </div>
    <div class="col col-4 offset-2">
        <figure class="figure">
            <a target="_blank" href="/assets/images/waitwait/chicago-2026/waitwait-notes-edited-show-1600px.jpg">
            <img src="/assets/images/waitwait/chicago-2026/waitwait-notes-edited-show-960px.jpg" class="img-fluid border" alt="Panelist, guest and scoring notes taken in a notebook while listening to the aired version of the show">
            </a>
            <figcaption class="figure-caption text-center">
                Notes taken while listening to the edited version
            </figcaption>
        </figure>
    </div>
</div>

Huge thanks to Colin and the folks at Wait Wait for lettting me visit their office and to see a taping on my birthday.

### Wait Wait Stats Library Updates

I have been working on a couple of updates to the [Wait Wait Stats Library](https://codeberg.org/qlp/wwdtm), including adding statistical variance calculated for each panelist's total scores and updating dependencies for packages like [NumPy](https://numpy.org/).

The other update that is currently in progress is to remove code branches and method parameters that check if decimal scores should be returned or used when calculating panelist statistics. I am making this change since all of the Wait Wait Stats applications that currently use the Stats Library, which includes the [Wait Wait Stats Page](https://stats.wwdt.me/), [Wait Wait Reports Site](https://reports.wwdt.me/), and the [Wait Wait Stats API](https://api.wwdt.me/), are currently configured to use the panelist decimal scores.

By removing the code branches in the Stats Library and those applications, it will help reduce the clutter and slightly reduce page load times or API endpoint calls due to the removal of those parameter checks.

Since the removal of the code branches and method parameters are breaking changes, the version is being bumped up to version 3. I don't expect any other major changes to the Stats Library within version 3.

Sometime late this year or early next, I plan on a complete re-work of the Stats Library that will replace returned data as dictionaries with classes. Those classes will be based on [Pydantic's BaseModel](https://pydantic.dev/docs/validation/latest/concepts/models/) so that they can be directly consumed by the next version of the Stats API and other applications.

The re-work will most likely use [SQLAlchemy](https://www.sqlalchemy.org/) to abstract the database layer to allow the possibility of migrating from MySQL or MariaDB over to PostgreSQL for the database.

### Migrating Projects to Codeberg

Along with making updates to the Wait Wait Stats Project, I have started migrating some of my GitHub repositories, including the one for this site, over to [Codeberg](https://codeberg.org) under my [`qlp`](https://codeberg.org/qlp) account. The repositories that I have migrated are configured to mirror commits and changes back to the original repository on GitHub. Eventually, I will be removing the repositories from GitHub and creating a placeholder that will point folks to the repository hosted on Codeberg.

The migration has been fairly smooth thus far, with a couple of minor hiccups in repository mirroring from Codeberg to GitHub. I was also able to set up a webhook for the Wait Wait Stats Library repository on Codeberg so that new commits and tags can trigger documentation builds via [Read the Docs](https://about.readthedocs.com/).

Part of the reason for this migration is due to the continual cramming of GenAI and LLM into GitHub by Microsoft (especially now that GitHub is organizationally under Microsoft's CoreAI division). The other part of the reason is to further reduce my dependency on Microsoft (along with Google) for my everyday needs.

Eventually, I'll stand up a private instance of [Forgejo](https://forgejo.org/), the forge that Codeberg uses for their service on a spare Raspberry Pi or mini PC to host any private repositories.

### Audi For Life No More, For Real This Time

If you've known me for well over a decade, either online or in real world, you probably know that I used to be quite active in the Audi community and had a series of accounts that went by @AudiForLife on (then) Twitter, Facebook and Instagram.

After getting my 2017 Audi A4 allroad ([in Audi exclusive Ara Blue](https://audiforlife.com/2017/03/farewell-lovemys5-hello-lovemyallroad/)), I started to step away from being so online and eventually shuttered the accounts and stopped updating the blog.

This past weekend, I sold my 2017 Audi A4 allroad and replaced it with a 2026 Subaru Trailseeker EV (which I have named [Astrid](https://tardis.wiki/wiki/Astrid_Peth), an anagram of TARDIS) in Daybreak Blue. With that change, I have officially stepped away from the world of Audi.

<div class="row">
    <div class="col col-10 offset-1">
        <figure class="figure">
            <a target="_blank" href="/assets/images/trailseeker/daybreak-blue-subaru-trailseeker-1600px.jpg">
            <img src="/assets/images/trailseeker/daybreak-blue-subaru-trailseeker-1200px.jpg" class="img-fluid border" alt="Side view of a Daybreak Blue Subaru Trailseeker in a parking lot">
            </a>
            <figcaption class="figure-caption text-center">
                2026 Subaru Trailseeker in Daybreak Blue
            </figcaption>
        </figure>
    </div>
</div>

The reason why I chose to not get an Audi e-tron EV I'm no longer a fan of their design decisions, both exterior and interior, of their current line-up. Plus, the Q4 e-tron isn't a very good bargain given its somewhat lackluster interior quality and overall efficiency. The both the A6 and Q6 e-tron have better efficiency, but both are well outside of my budget.

When pricing for the Subaru Trailseeker was announced, I was pretty shocked that it was around a thousand more than the smaller platform mate, the Solterra. Given the wagon-esque proportions, estimated 272 mile range with the top trim, and almost all of features and creature comforts that I need, it was an easy decision for me.

I'll collect my thoughts into a blog post once it I reach the 3,000 mile (approximately 4830 kilometer) mark.

I have uploaded a [couple of photos of the new Trailseeker](https://flickr.com/photos/questionlp/albums/72177720333359073) on Flickr.
