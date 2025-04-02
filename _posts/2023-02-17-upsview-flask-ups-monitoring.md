---
layout: post
title:  "upsview: Flask UPS Monitoring Web Application"
date:   2023-02-17 2:00:00 -0800
tags:   python flask
---

**Note:** The name of the project and the application has been renamed to `upsview`. I have updated the post to reflect the name change.

After picking up a second UPS battery backup unit to provide backup power for my cable modem and a few items in my A/V stack that is located too far away from the primary UPS for my server and networking stack. I wanted to create something really simple and lightweight that can display information such as UPS load, battery charge level, and estimated battery run time.

I already had my primary UPS connected to my Synology NAS via a USB cable. Under the hood, Synology uses [Network UPS Tools](https://networkupstools.org/) to pull status and information from UPS units either via USB, SNMP or from another instance of their "UPS Server" software. For the second UPS unit, I dug out an unused Raspberry Pi 2 Model B in a basic translucent case, and loaded it up with [Raspberry Pi OS Lite](https://www.raspberrypi.com/software/operating-systems/) and Network UPS Tools.

Having already had built a number of web apps with [Flask](http://flask.palletsprojects.com/) and [Pure CSS](https://pure-css.github.io/), it was very easy to get the core part of the web app written. To retrieve information from the Synology NAS and the local instance of Network UPS Tools on the Raspberry Pi, I chose to use the [nut2](https://github.com/rshipp/python-nut2) Python package since it was easier to get things working than the [PyNUT](https://github.com/networkupstools/nut/tree/master/scripts/python/) module.

If you would like to be able to monitor a UPS connected directly to a Synology NAS via USB, you will need to enable and connect to the NAS using SSH. Once logged on to the NAS using SSH, the username and password you will need to use to authenticate is located in `/etc/ups/upsd.users`.

The first iteration of the web app would be served through [nginx](https://nginx.org/) by way of [uwsgi](https://uwsgi-docs.readthedocs.io/en/latest/). I had already used uwsgi with the other Flask web applications that I've built and deployed. Eventually, I switched over to using [Gunicorn](https://gunicorn.org/), since that is what I had migrated my other Flask web apps over to using.

Below is a screenshot of the generated web page for the two UPS units that I have at home:

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/upsview-screenshot.png">
    <img src="/assets/images/upsview-screenshot.png" class="img-fluid border" alt="upsview Web Application Screenshot">
    </a>
    <figcaption class="figure-caption text-center">
        Screenshot of the upsview web application
    </figcaption>
</figure>

Having felt like the web app was now at a good, stable point, I have published the project under the open source [MIT License](https://github.com/questionlp/upsview/blob/main/LICENSE). The [Git repository](https://github.com/questionlp/upsview) for the project is hosted on GitHub. I have included setup and installation instructions in the README file.
