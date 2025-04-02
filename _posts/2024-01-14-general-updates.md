---
layout: post
title:  "General Updates"
date:   2024-01-14 18:00:00 -0800
tags:   debian hardware linux laptops waitwait update
---

I have been busy with several updates to the Wait Wait Stats projects and changes to my homelab and ThinkPad.

### Wait Wait Stats Updates

After listening through all of the Wait Wait... Don't Tell Me shows from 1998, at least the audio I have; I am taking a break before listening to the shows from 1999.

Meanwhile, I have been going through doing a much-needed code cleanup of the Wait Wait Stats Library and the Stats Page. I have switched to using [Ruff](https://docs.astral.sh/ruff/) for code linting and formatting for both projects. Using Ruff with Visual Studio Code and Pylance has allowed me to quickly do some much-needed code cleanup, using new type aliases and using `pathlib` to handle file and path operations.

For more information on the Stats library changes, check the Changes page at [docs.wwdt.me](https://docs.wwdt.me/latest/changes/).

### ThinkPad Laptop Updates: Moving to Debian 12

In November, I [wrote a post]({% post_url 2023-11-27-laptop-lenovo-thinkpad-t14-gen-3 %}) about a Lenovo ThinkPad T14 Gen 3 laptop that I picked up to run Linux. After using Pop!_OS for a short time, I still wanted to be able to play around or even switch to KDE Plasma full-time. Unfortunately, package dependencies in Pop!_OS for KDE Plasma would replace the MySQL packages I installed with MariaDB packages. That's a non-starter for me.

I decided to back up my files and try out Debian 12. I chose Debian 12 as it was not laden with Ubuntu Snap, and it had a newer version of the kernel than Ubuntu 22.04 LTS (but older than the version in Pop!_OS). Installing and setting it up as a development system was quick but only with a few road bumps.

After using Ubuntu on the desktop or servers for a long time, I was used to many Ubuntu-isms. That includes remembering to install some simple utilities and applications usually included in a Ubuntu install by default but not on a Debian 12 install. Another difference between Ubuntu and Debian is the version of Firefox that the distributions track. By default, Ubuntu installs Firefox as a Snap package that tracks the latest releases of Firefox. In contrast, Debian 12's Firefox package installs Firefox ESR. If you want to install the newest version of Firefox using packages provided by Debian, you would need to switch to using the `sid` version of Debian.

To install the latest version of Firefox when running a stable or `testing` version of Debian, you will need to download the Linux build from Firefox's website, extract the files, and make a few tweaks. I have a [GitHub Gist](https://gist.github.com/questionlp/fa9f7b87c14e88bd25beda17d2931743) with steps I took to get it all working with KDE Plasma / Wayland.

I initially went from Kubuntu to Pop!_OS to avoid the graphical glitches I experienced using KDE Plasma on the ThinkPad. While the glitches happen when using KDE Plasma with Debian 12, the glitches happen less frequently.

### Servers: Also Migrating to Debian 12

After switching to Debian 12 on the ThinkPad laptop, I started migrating some virtual machines from Ubuntu Server 22.04 LTS to Debian 12. My motivation for moving away from Ubuntu is my dislike of Canonical's decisions regarding Snap and placing specific updates behind the Ubuntu Pro paywall (while Ubuntu Pro is free for personal use, it is limited to 5 devices). I started with my internal DNS servers and the servers that run development versions of the Wait Wait Stats applications to fix any problems that would arise.

I migrated the production Wait Wait Stats applications from an Ubuntu server to two instances running Debian 12 with Python 3.12 this weekend. I moved the hosting of the Stats Graphs and Reports applications onto a smaller instance, though the database is still hosted on the primary instance.

The only hurdle that I have with migrating everything, including the testing virtual machine running MySQL Server on my M1 Max MacBook Pro laptop, to Debian 12 is the lack of arm64 (or aarch64) builds of MySQL Server 8.0 from either Debian's or MySQL's official `apt` repositories for Debian and Ubuntu. Canonical provides up-to-date MySQL packages for Ubuntu systems running on the arm64 architecture as part of the default package repositories.

If I wanted to run MySQL Server 8.0 on Debian arm64 virtual machines, I would have to build it from source. I don't want to tackle that right now and will continue to use Ubuntu until I can sort things out.

I will still be running Ubuntu Server on several physical machines until I  replace them with new virtual or physical machines.
