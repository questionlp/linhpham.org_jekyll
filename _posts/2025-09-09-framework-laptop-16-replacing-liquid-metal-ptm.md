---
layout: post
title:  "Framework Laptop 16: Replacing Liquid Metal with PTM"
date:   2025-09-09 21:35:00 -0700
tags:   framework-laptop hardware laptops
---

Although liquid metal is excellent as a thermal conductivity and can keep power hungry processors and other chips relatively cool, it definitely has its problems. Liquid metal is electrically conductive and can pump out and escape out of its containment over time due to thermal cycling.

Framework initially used liquid metal for the Framework Laptop 16 in order to cool the AMD Ryzen 7040 series of mobile processors while keeping the laptop relatively thin. Unfortunately, the aforementioned liquid metal pumping out of the containment area became an issue and [Framework switched over to using the Honeywell PTM7958](https://frame.work/blog/framework-laptop-16-deep-dive---liquid-metal) thermal interface. They also provided existing owners of Laptop 16 owners the option to get a free PTM kit.

Although I didn't experience a lot of thermal throttling under normal use, but the keyboard, trackpad area and bottom of the laptop would get quite hot and very uncomfortable to use on a lap even on cooler days. I submitted a request to get the PTM kit not long after Framework opened up the support form. It arrived in the second half of May, but sat around for a while.

Unfortunately, work, projects and event left me with little spare time to do the swap. Also, I was really apprehensive after reading through Framework's [Liquid Metal -> PTM 7958 guide](https://guides.frame.work/Guide/Liquid+Metal+-%3E+PTM+7958/402?lang=en). I finally had a few hours to spare tonight and decided that it was time.

The whole process requires taking apart a significant portion of the laptop and disconnecting several fiddly cables. Thankfully, I was able to remove the wireless module with the antenna cables attached and I also had to remove the left memory module in order to get the heat pipe assembly off. Getting the assembly off took about 5 minutes of patiently prying all around the perimeter of the base.

Once the assembly was removed, I noticed that there wasn't a lot of (solidified) liquid metal on the processor die. Still, I used the spudger included with the laptop and an [iFixit Opening Tool](https://www.ifixit.com/products/ifixit-opening-tool). The flat end of my Framework spudger was getting a bit rough) and a lot of isopropyl alcohol in order to take off any remaining liquid metal that had solidified on and around the die.

When I looked at the bottom of the heat pipe assembly, I noticed quite a bit of the liquid metal had escaped from the containment sponge on both the processor package and base of the assembly. I immediately went to remove the chunk of solid liquid metal and checked to see if any had snuck its way into any nooks and crannies. Thankfully, I didn't see any and moved on to removing the protective sponge pieces and the adhesive that was bonded to the copper surface of the assembly.

That whole process took a good 20-30 minutes to finish as I didn't want to leave any speck of liquid metal around, since it is electically conductive. Once I didn't see any specks of the old stuff and the adhesive removed, I applied the piece of Honeywell PTM on to the processor die (which I had placed in the fridge to firm up ahead of time) and started to re-assemble my laptop.

The re-assembly process was relatively painless with the exception of inserting the cable for the power button and fingerprint reader into the motherboard connector. I probably spent close to 10 minutes trying to get that cable in and seated.

With everything buttoned up, expansion cards put back in place, plugged in the laptop and powered it up. I was nervous when I saw the keyboard backlight come on, turn off and turn back on with the screen not coming on. After about 2 minutes, the screen turned on and the Framework logo appeared. Must have been taking its time with memory training the 64 GB of DDR5 memory I had.

Fedora booted up and I logged in without any issues. I opened up a terminal window and ran [s-tui](https://amanusk.github.io/s-tui/) to check how the temperatures were looking. After idling for about 5 minutes, the CPU settled to around 39-40 degrees C, which is around 5 degrees C lower than before doing the liquid metal to PTM swap.

I used the stress test tool available within `s-tui` and saw processor temperatures climb up to around 99 degrees C after 10-15 seconds, but all cores were humming along at around 4.3 GHz. Before the swap, I saw clock speeds bounce around the 3.5 to 4 GHz on all cores. After stopping the stress test tool, I saw the temperatures quickly climbed back down to around 40 degrees C and the fans ramped down accordingly.

After the swap, the keyboard, trackpad area and bottom of the laptop are no longer uncomfortably warm under normal use.

The 40 to 60 minute estimated time required listed in the [Liquid Metal -> PTM 7958 guide from Framework](https://guides.frame.work/Guide/Liquid+Metal+-%3E+PTM+7958/402?lang=en) was low given the amount of time that is required if liquid metal escaped its containment area. I would recommend setting aside at least 90 minutes in case you need to clean up any escaped liquid metal.

The whole thing was quite a chore, but I am absolutely glad that I finally did it. The thermals of the laptop after the swap is what the baseline should have been when Framework designed and shipped out the laptops to customers. Framework has switched away from liquid metal going forward, including the even more thermally challenging AMD Strix Halo processors (I am **not** typing out or saying the full name of the processor because it is just bananas) used in their [Framework Desktop](https://frame.work/desktop) computers.
