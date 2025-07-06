---
layout: post
title:  "One Year With a Framework Laptop 16 and Fedora KDE Plasma Desktop"
date:   2025-07-06 16:40:00 -0700
tags:   linux hardware laptops
---

It has been a little over a year since I made the decision to migrate away from macOS to Linux as my primary operating system and placed an order for, then received, a Framework Laptop 16. I [wrote about my impressions two week in]({{ site.url }}{% post_url 2024-07-04-two-weeks-with-framework-laptop-16 %}) after install the [KDE Spin of Fedora Linux 40](https://fedoraproject.org/kde/) (which has since been [promoted to Fedora KDE Plasma Desktop](https://fedoramagazine.org/announcing-fedora-linux-42/)) and using it for two weeks.

Three weeks later, I had been using the Fedora almost full-time and only used macOS for iPhone-related tasks (such as: tranferring music and podcasts, making local backups of RAW photos that I take at shows and events, and using Lightroom Classic). On average, I spend less than 4 hours a month using the MacBook Pro while I am almost constantly on the Framework Laptop or my Lenovo ThinkPad T14 Gen 3 running Fedora.

In the "[Migrating from macOS to Fedora with a Framework Laptop 16]({{ site.url }}{% post_url 2024-07-29-migrating-from-macos-fedora-framework-laptop-16 %})" blog post, I detailed some of the steps I took to get Fedora all set up on the laptop, the applications that I migrated over to, and a couple of small snags that I ran into with the MediaTek wireless module.

In this blog post, I just wanted to provide an update on my experiences thus far using Fedora on the Framework Laptop for the past year.

## Stable, For the Most Part

When I decided to choose Fedora as my primary Linux distribution on my laptops, I knew going in that there will be some teething pains by using a more leading edge distro compared to a distro with a stable or LTS release cycle (such as Debian or Ubuntu). Fedora adopts newer versions of the Linux kernel, applications and libraries at a pretty quick pace, albeit not as fast as distros that follow a bleeding edge rolling release cycle like Arch Linux.

For the most part, I didn't have any problems with upgrading to new KDE Plasma, LibreOffice and Firefox versions as soon as they land in the Fedora package repositories, but it was really the faster pace releases of new Linux kernel versions that caused a few headaches.

The problem wasn't with the Linux kernel development process itself, but the drivers for AMD GPUs had some streaks of bugs that caused graphical corruption and overall stability issues. There were times where I stuck with an older kernel version by way of using DNF's version locking feature and using `grubby` to switch the default version away from the latest version. The issues primarily occurred towards the end of Fedora 40 and stayed around for a bit with Fedora 41. I am very glad to say that the issues have *mostly* gone away in Fedora 42.

The laptop does get quite toasty when under moderate to heavy load, hot enough where it's not comfortable to use on a laptop or to rest my hand and forearm on the keyboard and trackpad. Some of that can be attributed to AMD and Framework's power and thermal management, and possibly on the mess that is the power management setup on Fedora after going through several upgrades.

I did get a PTM thermal material from Framework that they offered for Framework Laptop 16 owners, but I haven't swapped out the liquid metal thermal interface for it yet. I am absolutely dreading the [extensive laptop teardown](https://guides.frame.work/Guide/Liquid+Metal+-%3E+PTM+7958/402?lang=en) that is required to do the swap.

I have recently experience some hard freezes when in Fedora either when in Power Save mode and on battery or when leaving the laptop alone for a little while and when there's an issue with `qtwayland` causing `loginctl` to crash out and freezes up the laptop. The latter is a [known issue and a seemed to have been fixed](https://bugzilla.redhat.com/show_bug.cgi?id=2375328). I'll post updates on my [Mastodon account (@qlp@linh.social)](https://linh.social/@qlp) if the issue continues to happen.

In contrast, the ThinkPad, which also runs the KDE Plasma edition of Fedora Workstation, that I use as my travel laptop rarely gets warm doing the same tasks even when setting power management to performance mode. Part of that is due to the version of the Intel Core processor it has, which has a lower maximum power draw than the AMD Ryzen processor in the Framework. Also, the ThinkPad also ramps up its fan a little bit more aggressively than the Framework.

When Fedora 43 is released, I plan on backing up my files on the Framework and doing a clean install to get a fresh start, especially when it comes to power management profiles.

## Small Hardware Updates

Outside of the issue that I mentioned in the first Framework Laptop 16 blog post where the USB Type-C charging cable was not working, I haven't had any other hardware issues since. I bought a set of USB Type-C expansion cards in lavender to match the spacers and screen bezel, as well as the full-sized SD card reader.

Usually, I have five of the lavender USB Type-C expansion cards (two on each side, slotted into the rear-most and middle slots, plus one on the front-most right side slot) and a standard USB Type-A expansion card on the front-most left side slot. The Type-A port is quite useful when I'm using a small microSD card reader with a Type-A connector and have a full-sized SD card reader slotted in to copy or clone microSD cards for my Raspberry Pis or handheld game consoles.

I also got the RGB US English version of the keyboard mostly so that I can have a different color backlight than just white. I don't really care for LEDs that change colors or patterns, especially when not doing anything. I ended up carefully prying off the `Super` and `Alt Gr` keycaps from the International English (Linux) keyboard so that I wouldn't have to have a Windows keycap on a laptop running Linux. I have uploaded the RGB version of the QMK/VIA keymaps on my [framework-laptop-16](https://github.com/questionlp/framework-laptop-16) repository.

Not long after I received my Framework Laptop, Framework [announced a new version of the webcam module](https://frame.work/blog/framework-laptop-13-deep-dive---a-laptop-webcam-with-smartphone-technology) that includes pixel binning and backside illumination to improve the quality of the webcam image. I don't do a lot of video calls, but I thought it would be interesting to see how much of an improvement the new module makes.

After ordering and receiving the new module, the process to swap out the old module with the new one was a little bit fiddly. The [written guide](https://guides.frame.work/Guide/Webcam/302?lang=en) that Framework provides was well written and had good photos for each step. What I had issues with was just my manual dexterity is not great, so I had a more trouble with the connector's latching mechanism, shims and getting the whole thing back in properly. Software like Zoom and OBS Studio picked up the new webcam without any issues.

In terms of image quality, there was a tiny bit of improvement in overall sharpness with decent lighting, but it did better in poorer lightning conditions. While it probably wasn't worth the cost to upgrade, given the little amount that I use the webcam in general, but the small bump in image quality was still nice to have.

## App Gaps? Nah

Also mentioned in the "Migrating from macOS" blog post, I had settled into a good place with using [LibreOffice](https://www.libreoffice.org/) and [Nextcloud](https://nextcloud.com/) in place of either Microsoft Office or Apple iWork suite and Dropbox for file syncing.

[KDE Connect](https://kdeconnect.kde.org/) has been extremely handy for transferring processed photos and files between my Fedora laptops, iPhone and Android-based handheld gaming consoles. It isn't quite as responsive or seemless as Apple's AirDrop and it doesn't support text notification passthrough (due to limitations that Apple puts on third-party applications). There can be a 15-30 second delay from when I open the KDE Connect app on my iPhone or wake up my Android handhelds to them seeing either of my Fedora laptops.

I haven't missed Adobe Photoshop for image editing or Adobe Illustrator for vector drawing, as I'm able to do most of my image creating and editing needs with [Krita](https://krita.org/en/) and [GNOME Image Manipulation Program](https://www.gimp.org/), along with [Inkscape](https://inkscape.org/). I've seen some weirdness with Krita crashing when opening files originally created in Photoshop or exported from Illustrator. I haven't determined the issue, but I'm guessing it might be due to color profiles or other Adobe shenanigans. [Photopea](https://www.photopea.com/) has come in clutch when I needed to quickly edit and turnaround Photoshop PSD files that the other tools don't handle too well.

After a year, I don't have any yearnings of using applications and programs that I had been using solely on macOS that I cannot use on Linux. I've started to learn the magical incantations that are FFmpeg command-line arguments for transcoding media files instead of using something like Rogue Amoeba's [Fission](https://rogueamoeba.com/fission/). I still need to learn how to capture and record audio output from one application into another without somewhat brute-forcing it with OBS Studio or find a tool that is more similar to Rogue Amoeba's [Audio Hijack](https://rogueamoeba.com/audiohijack/).

## If I Could Turn Back Time Machine

When I was using macOS, I used the included Time Machine program to backup the whole drive out to a pair of Samsung T7 USB solid state drives. When I was looking for backup options for my Linux laptops, I looked at [Timeshift](https://github.com/linuxmint/timeshift) from the [Linux Mint project](https://linuxmint.com/) and [BorgBackup](https://www.borgbackup.org/), also known as Borg.

Both Timeshift and Borg support various forms of encryption and can use both local and remote storage as their backup destinations. Timeshift primarily focuses providing system-level snapshots to allow rolling back changes if an update breaks things badly. In order to do that effectively, Timeshift excludes users' home directories from backups and recommend other tools to backup those files.

Since I was looking more for a tool to backup my home directory and other key directories, that meant Borg would suit my needs better. As I was looking at Borg, I found [Pika Backup](https://apps.gnome.org/PikaBackup/) which uses Borg at its core. Pika Backup provides an easy to use interface and has built-in support for scheduling backups.

I selected two of the four Samsung T7 SSDs that I had been using on the Raspberry Pi 4 systems running VMware ESXi on ARM. I used `smartctl -x` on each of the drives to determine the ones with the last amount of data written to them. Instead of using Pika Backup's encryption, I opted to create a LUKS-encrypted BTRFS volume on each drive (leaving a few percent of the drive unused to improve wear-leveling) since I could use them to store small amounts of data while keeping them encrypted as well.

Although I passed on Timeshift to backup my personal files, it's still an option to provide snapshots of the system in case a system upgrade goes sideways. Another option would be to use a BTRFS snapshot management tool to create those snapshots myself.

## Forward Looking

I am looking forward to continue to my journey with daily driving the Framework Laptop 16 and Fedora and am interested in seeing what motherboard upgrade options Framework will make available for it in the future.

I kind of would like to see an Intel-based motherboard with Arc-based mobile graphics that can still accept either dual M.2 NVMe module or the AMD Radeon graphics expansion module. While I don't not like the AMD Ryzen processor, it would still be nice to see another option made available that has a mix of high, medium and lower-performance cores to help reduce power consumption and thermals when the processors aren't doing a lot of work.

Even though I mentioned that I would be doing a clean install of Fedora 43 when it is released, I don't plan on switching to Fedora Atomic or changing desktop environments, as KDE Plasma meets all of my needs. Though, [niri](https://github.com/YaLTeR/niri) does look interesting.
