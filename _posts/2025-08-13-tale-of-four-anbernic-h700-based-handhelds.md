---
layout: post
title:  "A Tale of Four Anbernic H700-based Handhelds"
date:   2025-08-13 19:20:00 -0700
tags:   video-games anbernic retroarch emulation rgxx h700
---

Over the past couple of years, I have been building up a decent collection of handheld consoles that target software emulation of video games (and two that are FPGA-based that are built to virtually replicate/emulate original hardware). Four of those handhelds share two important characteristics: they are built by [Anbernic](https://anbernic.com/) and use the Allwinner A700 ARM-based system on a chip.

<div class="alert alert-info">
    <p>
        KNULLI just announced the release of a new version of their custom firmware codenamed <a href="https://github.com/knulli-cfw/distribution/releases/tag/20250813" target="_blank">Gladiator II</a> right before publishing this post. The new version requires a re-flash of the microSD card containing the firmware and requires a clean <code>userdata/system</code> directory.
    </p>
    <p class="mb-0">
        As such, I haven't had a chance to try out the new version and I don't know if it will resolve some of the issues mentioned in this post. I'll publish an update if the new release resolves any of the issues.
    </p>
</div>

## Table of Contents

<div class="row ms-2">
    <div class="col col-lg-6">
        <ul>
            <li><a href="#overview-of-the-anbernic-rgxx-handhelds">Overview of the Anbernic "RGXX" Handhelds</a>
                <ul>
                    <li><a href="#additional-notes-and-caveats">Additional Notes and Caveats</a></li>
                </ul>
            </li>
            <li><a href="#rg35xx-h-the-candy-bar">RG35XX H: The Candy Bar</a></li>
            <li><a href="#rg35xx-sp-game-boy-advance-sp-inspired">RG35XX SP: Game Boy Advance SP-Inspired</a></li>
            <li><a href="#rg34xx-h-og-game-boy-advance-inspired">RG34XX H: OG Game Boy Advance-Inspired</a></li>
            <li><a href="#rg40xx-v-vertical-and-bigger-screen">RG40XX V: Vertical and Bigger Screen</a></li>
            <li><a href="#knulli-and-common-issues">KNULLI and Common Issues</a></li>
            <li><a href="#closing-thoughts">Closing Thoughts</a></li>
        </ul>
    </div>
</div>

## Overview of the Anbernic "RGXX" Handhelds

Anbernic has a series of handhelds that Allwinner's H700 system on a chip that include four cores based on the 64-bit [ARM Cortex-A53](https://www.arm.com/products/silicon-ip-cpu/cortex-a/cortex-a53) cores capable of running at 1.5 GHz and include 1GB of LPDDR4 memory. The series of handhelds, which are commonly referred to as the "RGXX" series, differentiate themselves with different screen sizes, form factors and niche features.

In terms of software, they come standard with Anbernic's custom build of a Linux-based firmware but there are several third-party custom firmware that support some or all of the RGXX handhelds.

Of the RGXX series of handhelds, I have four of them: the RG35XX H, RG35XX SP, RG34XX H and the RG40XX V. I'll go over each of the handhelds below, including what makes some of them unique and my thoughts on them.

I'll be wrapping up this post with my thoughts on the KNULLI custom firmware (which is based on [Batocera.linux](https://batocera.org/)) that I am using on all four of the RGXX handhelds, along with some of the issues that KNULLI and the handhelds have in common.

One thing that I did want to mention here is the charging situation with the handhelds. None of the RGXX series handhelds support any form of USB power delivery (USB-PD) and do not support any form of voltage negotiation. Charging via the USB Type-C port only accepts 5 volts and may not reliably charge when plugged into chargers that support USB-PD. This is similar to the custom rechargeable battery kits available for the original Game Boy and Game Boy Advance handhelds that I have.

I charge my Anbernic handhelds by plugging into multi-port chargers with USB Type-A ports and only provide 5 volts. This is something to keep in mind if you are plannning to get into the RGXX series or rechargeable battery kits for OG handhelds.

## RG35XX H: The Candy Bar

Although the first emulation handheld console that I had was the Nintendo Game Boy-inspired Anbernic RG351V, the form factor and ergonomics left much to desire, so I ended up getting an RG351MP to replace it. The RG351MP has a horizontal, or candy bar, form factor that felt more better to hold.

<div class="row">
    <div class="col-6 offset-3">
        <figure class="figure">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg35xx-h.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg35xx-h.jpeg" class="img-fluid border" alt="A black Anbernic RG35XX H handheld console">
            </a>
            <figcaption class="figure-caption text-center">
                Anbernic RG35XX H running KNULLI
            </figcaption>
        </figure>
    </div>
</div>

The reason why I replaced the RG351MP was due to it started to have issues after two years where the graphics would get corrupted and lock up the handheld. The RG35XX H is also smaller than the Anbernic RG552 and the RG35XX H is passively cooled; although, by that time, I had already removed the noisy fan from the RG552 and slapped on more heatsinks, but it would still struggle when it came to thermals. After ordering the RG35XX H, I picked up a pair of new 32 GB SanDisk microSD cards rather than deal with the questionable cards that Anbernic shipped with their handhelds.

In terms of size, the dimensions of the RG35XX H comes in pretty close to the RG351MP as both devices have a 3.5-inch (~89 mm) screen that supports 640x480, have two microSD/TF card slots, similar button layout, as well as having dual joysticks. Due to the aluminum casing, the RG351MP weighs about 50% more than the RG35XX H. The handheld's size and weight makes it a great pocketable handheld for playing games on the move.

The Super Famicom/Nintendo button layout, the Start and Select buttons, and the the D-pad are in a comfortable position for my hands and fingers. The size and position of the L1/L2 and R1/R2 shoulder buttons are not ideal, but are positioned well as rests for my index fingers when playing games that don't use shoulder buttons. Between the positions of the joysticks and not playing games that would benefit from using them, I don't use them. With the joysticks being semi-recessed, they do not get in the way no matter what grip I use.

## RG35XX SP: Game Boy Advance SP-Inspired

Of the two original Nintendo Game Boy Advance handhelds that I have, I tend to prefer playing on the SP with its backlit screen (mine is one of the AGS-101 revisions with a better backlight than the original AGS-001) and compact size when folded. The ergonomics was a bit of a step back from the original GBA, but nothing could beat having a good backlit screen.

When Anbernic announced the heavily GBA SP-inspired RG35XX SP handheld, I didn't immediately order one, since I had been spending time with other handhelds, including the Steam Deck and the AYN Odin2 that I got. After watching a few reviews and waiting for custom firmware to be fairly stable on the RG35XX SP, I decided to order one.

<div class="row">
    <div class="col-4 offset-4">
        <figure class="figure">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg35xx-sp.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg35xx-sp.jpeg" class="img-fluid border" alt="A translucent blue Anbernic RG35XX SP handheld console">
            </a>
            <figcaption class="figure-caption text-center">
                Anbernic RG35XX SP running KNULLI
            </figcaption>
        </figure>
    </div>
</div>

I opted for the translucent blue version purely for it being translucent and being a nice shade of blue. After receiving the handheld and separately ordered another set of microSD cards, I initially tried [MuOS](https://muos.dev/) on the handheld, as it had better initial support for handling "sleep" mode when the handheld is closed. I would later switch to KNULLI after they improved the handling of going in and out "sleep" mode when opening the handheld.

<div class="row">
    <div class="col col-5 offset-1">
        <figure class="figure">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg35xx-sp-gba-sp-closed.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg35xx-sp-gba-sp-closed.jpeg" class="img-fluid border" alt="Top down view of a closed translucent blue Anbernic RG35XX SP and a closed dark gray Nintendo Game Boy Advance SP">
            </a>
            <figcaption class="figure-caption text-center">
                Comparing the size of an RG35XX SP and a Game Boy Advance SP
            </figcaption>
        </figure>
    </div>
    <div class="col col-5">
        <figure class="figure">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg35xx-sp-gba-sp-ports.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg35xx-sp-gba-sp-ports.jpeg" class="img-fluid border" alt="Top down view of the ports of a translucent blue Anbernic RG35XX SP and a dark gray Nintendo Game Boy Advance SP">
            </a>
            <figcaption class="figure-caption text-center">
                Comparing the ports and shoulder buttons of an RG35XX SP and a Game Boy Advance SP
            </figcaption>
        </figure>
    </div>
</div>

When comparing the RG35XX SP against the original GBA SP, the former is noticeably thicker the latter and slightly larger in the other two dimensions. The slightly wider and deeper dimensions are in part to accomodate the 3.5-inch (~89 mm) screen (same size and resolution as the RG35XX H) and the extra set of shoulder buttons. The extra thickness does make the handheld a little better to hold and play games on than the GBA SP, but less comfortable to carry around in my pocket compared to the GBA SP or the RG35XX H.

Since the 3.5-inch screen is essentially the same as the RG35XX H, the 4:3 aspect ratio means that GBA games will be letterboxed with black bars above and below the game display area when not using integer scaling. When using 2x integer scaling, the actual game display area will be smaller than on the original GBA.

Due to the shape of the handheld, the position and size of the L1/L2 and R1/R2 shoulder buttons feel better to use than the RG35XX H. Unlike the RG35XX H, but similar to the GBA SP, the RG35XX SP only has one speaker firing up from the button deck. The lack of any joysticks is not a problem for me since, as mentioned in the RG35XX H section above, the sames I play on the RGXX handhelds don't benefit from them.

On the topic of buttons, the tactile dome buttons that Anbernic uses in the RG35XX SP are definitely on the loud and firm side of things, especially compared to my well-used GBA SP. The shorter and firmer button actuation makes playing on the RG35XX SP a lot more tiring than on any other handheld that I owned, and that includes a modded GBA enclosed with a metal case and has metal buttons.

Thankfully, there is a mod that can be done to reduce both the noise and make the buttons feel a little better to press down. Opening up the RG35XX SP is a chore with the number of screws and fiddly cables and connectors. The mod usually requires [placing small pieces of tape](https://retrohandhelds.gg/anbernic-rg35xx-sp-quieter-buttons/) over each of the metal tactile domes. I opted to place small pieces of Kapton tape over the domes, then adding small pieces of masking tape on top to get the sound profile and button feel more to my liking.

Even with the mod, using the D-pad and buttons is still a bit fatiguing after about 15 minutes, especially when playing platformers and fighting games. Given the finger fatigue issue when using the handheld for longer periods of time and scaling situation when playing GBA games on the RG35XX SP, I end up playing GBA games on my original GBA SP than the RG35XX SP. Still, I tend to carry around the RG35XX SP more often than I do the RG35XX H solely due to the size of the handheld when closed.

## RG34XX H: OG Game Boy Advance-Inspired

Not content with just one handheld console inspired by a Game Boy Advance, Anbernic released another GBA-inspired handheld. This time, they made the RG34XX H and it is heavily inspired by the original GBA, mimicking the overall shape and size and general button layout (along with a few other buttons). The RG34XX H is very slightly wider than the original GBA and feels nearly identical in the hand.

<div class="row">
    <div class="col-6 offset-3">
        <figure class="figure w-100">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg34xx-h.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg34xx-h.jpeg" class="img-fluid border" alt="An indigo/purple Anbernic RG34XX H handheld console">
            </a>
            <figcaption class="figure-caption text-center">
                Anbernic RG34XX H running KNULLI
            </figcaption>
        </figure>
    </div>
</div>

Anbernic did take slight liberties with the design by adding smaller Y and X buttons buttons above the standard GBA B and A buttons, as well as L2 and R2 shoulder buttons that are located more inboard and back from the usual L and R buttons. I appreciate that they didn't put the L2 and R2 buttons directly next to the L1 and R1 buttons. Along with the shoulder buttons are the dual microSD/TF card slots, a reset button, a singular USB Type-C On-The-Go port that is also used for charging, a mini-HDMI port and a Menu button.

Although the microSD/TF slots on all of my RGXX handhelds have a tendency to eject the microSD cards with some good force, the location of the slots at the top of the RG34XX H can lead to the cards ejecting towards your eyes if the top of the console points towards your face. The other devices have the slots either on the bottom edge or to the side.

Along the bottom of the handheld is a standard power button, instead of a sliding power switch, and a rocking wheel-type switch for volume controls, rather than a normal wheel used on the original.

<div class="row">
    <div class="col col-4 offset-2">
        <figure class="figure">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg34xx-h-gba-front.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg34xx-h-gba-front.jpeg" class="img-fluid border mx-50" alt="Top down view of an indigo/purple Anbernic RG34XX H and a white Nintendo Game Boy Advance">
            </a>
            <figcaption class="figure-caption text-center">
                Comparing the size of an RG34XX H and a Game Boy Advance
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg34xx-h-gba-top.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg34xx-h-gba-top.jpeg" class="img-fluid border" alt="Top down view of the ports of an indigo/purple Anbernic RG34XX H and a white Nintendo Game Boy Advance">
            </a>
            <figcaption class="figure-caption text-center">
                Comparing the ports and shoulder buttons of an RG34XX H and a Game Boy Advance
            </figcaption>
        </figure>
    </div>
</div>

The 3.4-inch (~86 mm) screen has an aspect ratio of 3:2 and a resolution of 720x480, which matches the aspect ratio of the original GBA and offers perfect 3x integer scaling. The larger game display area makes reading text on games like Final Fantasy I & II: Dawn of Souls and Final Fantasy IV through VI Advance much easier.

Also, the 3:2 aspect ratio of the screen does mean that games that use 4:3 or 8:7 aspect ratios will cause the display area to be sandwiched by vertical bars. The placement of the Y and X buttons being smaller and slightly off-axis compared to the B and A buttons makes playing Super Famicom and Super Nintendo games worse ergonomically.

The other issue that I have with my RG34XX H is the D-pad is super sensitive, causing unwanted diagonal presses when I am slight off from Up, Down, Left or Right. There are mods that would help prevent those unwanted diagonals, but taking apart the RG34XX H is much more fiddly and finicky compared to the RG35XX SP. Thus, I haven't attempted the mod yet.

In all, the RG34XX H is great for GBA games and that's what I primarily use it for. And, that also means that it is not the RGXX handheld that I will take with me most of the time.

## RG40XX V: Vertical and Bigger Screen

Anbernic sells several versions of the RGXX handhelds that have a vertical form factor that takes inspiration from the original Game Boy. As mentioned earlier in this post, I have owned one of their earlier vertical form factor handhelds before, but did not like the ergonomics. When Anbernic announced the RG40XX V, an RGXX handheld with a 4-inch (~102 mm) screen, I kind of hesistated in ordering one.

I held out on getting one until I saw that they had changed the ergonomics of the shoulder buttons on the back side of the handheld, added a little dish-shaped dip around the D-pad and the B, A, Y and X control buttons, plus more positive overall reviews. Once I opened the box and held the RG40XX V, it felt a lot better to hold and press the rear shoulder buttons than the older RG351V.

<div class="row">
    <div class="col-4 offset-4">
        <figure class="figure w-100">
            <a target="_blank" href="/assets/images/handhelds/anberic-rgxx/rg40xx-v.jpeg">
            <img src="/assets/images/handhelds/anberic-rgxx/rg40xx-v.jpeg" class="img-fluid border" alt="An indigo/purple Anbernic RG40XX V handheld console">
            </a>
            <figcaption class="figure-caption text-center">
                Anbernic RG40XX V running KNULLI
            </figcaption>
        </figure>
    </div>
</div>

Even though it has a larger screen compared to the other RGXX handhelds that I have, the 4:3 aspect ratio screen still has a resolution of 640x480. While it does make pixels a little chunkier than on the 3.5-inch screens with the same resolution, but it does make reading text and seeing smaller sprites on the screen a lot better.

As with the RG35XX H, I do not use the analog joystick that lives in the lower-left of the handheld and it does not get in the way. The LED ring that surrounds the joystick is helpful when the handheld is powered up, but I wished it would have been used to show the charging status when powered off. The poor placement of the tiny power and charging status lights on the top of the handheld is my only complaint. The location of the single speaker is in the same lower right corner as on the original Game Boy, which means it can sometimes get covered up by my right palm depending on how I'm holding it.

The D-pad does not exhibit the unwanted diagonals like the RG34XX H and the dish-shape dip around the it and the buttons make using them better than the flush face of the RG35XX H and the RG34XX H. The placement of the other buttons are also spot on, with the power and reset buttons towards the top of the right edge and the Menu, Start and Select buttons in between the D-pad and the four control buttons.

Due to the large size, I don't often take it with me, but it is perfect for playing games at home or when I am taking backpack with me and I don't have room for one of my AYN Odin2 handhelds.

## KNULLI and Common Issues

All four the RGXX handhelds that I have are currently running the latest stable release of KNULLI, [Gladiator](https://github.com/knulli-cfw/distribution/releases/tag/20250505) with the custom firmware loaded on a microSD card in the first card slot and another ExFAT formatted microSD card in the second card slot used for storing games, saves, save states and assets. I mentioned towards the beginning of the post that I tried MuOS on the RG35XX SP since it initially had better support for "sleep" mode, but KNULLI caught up in a later release and I wanted all four devices to run the same custom firmware.

By running the same custom firmware on all of my RGXX devices, I can use the same [Syncthing](https://syncthing.net/) configuration to sync my saves and save states stored under `/userdata/saves` between a server running Syncthing and the other devices. That setup has been very helpful when bouncing between handhelds and stop playing games on one device, sync the files, then continue playing the same game on another device. Sometimes Syncthing won't auto-restart or pick up changes after exiting a game and that may be due to the network connection not being re-established. I generally have to restart the handheld for the network connection to come back up and Syncthing can do its... thing.

For all of the consoles that I emulate, including the 8-bit and 16-bit Nintendo and Sega home and portable consoles, I use the emulator cores KNULLI use as defaults, enable integer scaling and use the `sharp-bilinear-simple` shader, and use the core provided game aspect ratio. While not the most optimal in performance and does not provide a "retro" look, it reduces stutters, introduces minimal lag and gives even energy bar segments in games like Mega Man III and Mega Man X.

Unfortunately, I cannot get good performance when using cores like [Mesen](https://docs.libretro.com/library/mesen/) for the NES and Famicom Disk System or either [Mesen-S](https://docs.libretro.com/library/mesen-s/) or [bsnes](https://docs.libretro.com/library/bsnes_accuracy/) for the Super Famicom and Super Nintendo. Using non-default cores with default settings would cause audio slowdown and/or stuttering, increased lag and game slowdown. No matter what settings I tweaked, I could not get those cores to run at 100% speed without issues. I don't know if it's due to the Allwinner H700 processor or the lack of optimizations for those particular cores.

If there was one system that playing games on the RGXX handhelds are really good at are games for the PICO-8 fantasy console, but only if you use the [official PICO-8](https://www.lexaloffle.com/pico-8.php) emulator built for the Raspberry Pi and follow the steps provided in the [KNULLI Wiki](https://knulli.org/systems/pico-8/) to get it set up. The PICO-8 emulators available via [libretro](https://www.libretro.com/), including [fake-08](https://github.com/jtothebell/fake-08), do not perform that well, especially for games that really push official PICO-8 emulator.

Battery life on the handhelds are okay when keeping the display brightness at about half where I can play Game Boy, NES and Super Nintendo games for a couple of hours before needing to recharge. The biggest problem that I have with the RGXX devices is the "sleep" mode drains the battery a lot when left unplugged. There are times where I leave either the RG40XX V or the RG35XX SP in "sleep" mode with around 80-85% charge and come back later in the day with 20-30% charge.

The only reliable way that I have to keep the battery from discharging so much when not using the devices is to do a full shutdown if I know that I won't be using them for a couple of hours.

With the any of the handhelds in a powered off state, turning on the device and have it boot into KNULLI can be a bit frustrating. To fully power on the device, you have to press and hold the power button for 3-5 seconds, then let go of the button. If you just tap the button or do not hold the button down for the right time, you end up with the KNULLI wake up screen that shows the battery's state of charge and a message to press the power button to boot into KNULLI. If you end up with that wake screen, there is a small window to press the power button to start the boot before the screen turns off and repeat the process.

I have also run into an issue where I shutdown the device within KNULLI and the device powers off, but the screen backlight stays or turns back on for a few seconds, then turns off. This is more of an issue with the RG35XX SP where the green power light stays on after closing the handheld and sometimes hangs, causing the battery to continue draining. I would have to press the reset button and go through the boot and shutdown process again.

## Closing Thoughts

For the most part, I continue to have fun playing games, especially PICO-8 games, on the four RGXX handhelds that I have. If I were to recommend the RGXX handhelds that I have, it would be:

* Best overall and pocketable: RG35XX H
* Best overall, but not very pocketable: RG40XX V
* Game Boy Advance games: RG34XX H

While the RG35XX SP is the most pocketable of the four handhelds, I feel like the potential finger and hand fatigue when using the rather firm, tactile buttons, even with mods, dull the experience quite a bit. Plus, playing GBA games isn't entirely ideal due to being limited to 2x integer scaling with a small view area or non-integer full-screen scaling with the increased changes of stutters and shimmering.

A better alternative would be the RG34XX SP which is basically an RG35XX SP with a 3.4-inch 3:2 aspect ratio display that is very similar to the [RG34XX H](#rg34xx-h-og-game-boy-advance-inspired) that allows for 3x integer scaling. Unlike the RG35XX SP, the bezels around the RG34XX SP's display are thicker at the top and pushes the screen closer to the hinge. This isn't as optimal as the RG35XX SP. The new handheld also has two joysticks, but I'm not sure how useful they really are, given what systems the RGXX handheld can decently handle and the ergonomics of it all.

As I am writing this post, most of the devices are going for 50 or 60 USD before shipping and possible tarrifs. That also does not include purchasing reputable microSD cards to flash KNULLI or any of the other custom firmware and load games on to. There are definitely some rough edges around the experience and may be enough to turn people away.

On the flip side, it is an easier and more convenient option than finding and modding Sony PSP or PS Vita handhelds, or even Nintendo DS, DSi or 3DS handhelds, to emulate the same systems that the RGXX can play reliably.

If you are still interested in picking up one of the Anberic RGXX handhelds, checkout Retro Game Corps' [Anbernic RG35XX Family Starter Guide](https://retrogamecorps.com/2024/06/07/anbernic-rg35xx-family-starter-guide/) and their [videos](https://www.youtube.com/@RetroGameCorps/search?query=rgxx) on YouTube.
