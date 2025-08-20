---
layout: post
title:  "Upgrading the Anbernic RGXX Handhelds to KNULLI Gladiator II"
date:   2025-08-19 17:40:00 -0700
tags:   video-games anbernic retroarch emulation rgxx h700
---

About a week ago, I published my thoughts on four of the Anbernic "RGXX" handhelds that I have in the post titled "[A Tale of Four Anbernic H700-based Handhelds]({{ site_url }}{% post_url 2025-08-13-tale-of-four-anbernic-h700-based-handhelds %})". Right before I finished the post, [KNULLI](https://knulli.org/) announced a new version of the custom firmware named "[Gladiator II](https://github.com/knulli-cfw/distribution/releases/tag/20250813)" and I decided to hold off on upgrading for a few days.

The reason why I held off is that the official steps to upgrade from Gladiator, the previous version, to Gladiator would require re-flashing the microSD card containing the custom firmware. Since I used a second microSD card to store the various game files and settings for each handheld, it also required me to rename the `system` directory on the second microSD card and re-configure each handheld again.

I finally had a couple of hours to spare and decided to use my RG35XX H as the first test subject. Before starting, I downloaded the compressed image files from the [release page](https://github.com/knulli-cfw/distribution/releases/tag/20250813) on GitHub and extracted a couple that had been recompressed as 7zip files. I mounted the second microSD card on my laptop, renamed the `system` directory, and copied over the new version of the [PICO-8](https://www.lexaloffle.com/pico-8.php) emulator that also released a couple of days ago. Leaving that microSD card out, I removed and re-flashed the first microSD card, inserted it into the first slot and powered on the RG35XX H. Once the custom firmware booted up, resized the partitions and dropped me into EmulationStation, I inserted the second microSD card, configured KNULLI to use the second card, and rebooted.

Once the handheld booted back up, I went through the various menus to get everything set back up the way that I wanted (using one of my other RGXX handhelds a reference). I re-enabled [Syncthing](https://syncthing.net/), created an SSH tunnel to the handheld mapping port 8384 to a local port on my laptop, and had to set the synced directory with my saves and save states back up. This required me to log into my main Syncthing server, remove and re-add the handheld as a remote device, then shared the sync directory to the newly (re-)created device.

I used the menu option to install (rather upgrade the version of) PICO-8 on to the handheld, which went smoothly. I just had to go in and set the official emulator up as the default emulator for PICO-8 games.

All told, it took me about 45 minutes to go through that process the first time around. For other three handhelds, it took me about 20-25 minutes each to go through the same process.

I didn't notice any major changes to EmulationStation, RetroArch or the PICO-8 emulator, at least with the games that I normally play on those handhelds. What will be helpful going forward is the new over-the-air (OTA) update process that's now available starting with the Gladiator II verson of KNULLI.

One thing that has been a common issue with my RGXX handhelds is battery drain while the devices were in "sleep" mode. A couple of items mentioned in the [changelog for Gladiator II](https://github.com/knulli-cfw/distribution/blob/knulli-main/knulli-Changelog.md) (see below) has me hopeful that the battery drain situation won't be as much of an issue as before.

> * Improved power-off handling for various devices
> * Updated battery management and power saving
> * Improved lid control mechanisms

The new version of KNULLI is welcomed and will hopefully improve the user experience from a software standpoint, but it won't be able to solve some of the hardware issues and complaints that I have with the tactile buttons on the RG35XX SP or the overly sensitive D-pad on the RG34XX H.
