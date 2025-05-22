---
layout: post
title:  "Wait Wait Stats: New Versions Published"
date:   2023-08-30 20:40:00 -0700
tags:   waitwait update
---

As a follow-up to my [last blog post]({{ site.url }}{% post_url 2023-08-28-wait-wait-stats-update-decimal-scores %}), I have published the latest versions of the Wait Wait Stats applications and API to production. The [wwdtm](https://github.com/questionlp/wwdtm) package has also been published to [PyPI](https://pypi.org/project/wwdtm/), and [docs.wwdt.me](https://docs.wwdt.me/) has been updated with docs for the new version.

- Stats API: [api.wwdt.me](https://api.wwdt.me/)
- Graphs Site: [graphs.wwdt.me](https://graphs.wwdt.me/)
- Reports Site: [reports.wwdt.me](https://reports.wwdt.me/)
- Stats Page: [stats.wwdt.me](https://stats.wwdt.me/)

This also coincides with the site migration from a server instance deployed at DigitalOcean to a cloud server instance deployed at Hetzner. The reason for migrating cloud hosting providers is that Hetzner provides better performance at a lower cost than the instance size I used at DigitalOcean.

I considered Linode, as they have a data center in Central US. However, the performance-to-cost ratio is minimally better than DigitalOcean. I also looked at ARM-based instances at Oracle Cloud and Amazon AWS, which performed worse at similar prices to Hetzner cloud instances. Google Cloud and Microsoft Azure were not considered due to their higher costs, even for basic instance sizes.

The sites are also now being served through CloudFlare to provide protection against various denial-of-service attacks, reducing unwanted bot traffic and providing faster serving of static content and files.
