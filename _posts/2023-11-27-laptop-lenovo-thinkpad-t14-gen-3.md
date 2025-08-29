---
layout: post
title:  "Laptop: Lenovo ThinkPad T14 Gen 3"
date:   2023-11-27 18:35:00 -0800
tags:   hardware laptops lenovo linux thinkpad
---

I have a 16" M1 Max MacBook Pro for my daily driver laptop, and I have several laptops (including the two MacBook Pros I had as my daily drivers) that I keep around for backup, development testing, or if I need to run any software that requires Windows. While the MacBook Pro is smaller than some gaming laptops or mobile workstations, it is still too big to carry around when I want to be out and about. So, I was on a mission to find a (relatively) inexpensive secondary laptop.

### Steam Deck?

I did consider using a Steam Deck as a secondary device, given that Steam OS is built on Arch Linux and has a desktop environment that runs KDE Plasma. But, it is only portable once you add a keyboard, mouse, trackpad, and USB hub. Also, the screen is too small to use on the go outside of playing games (thanks to EmuDeck).

### Surface Pro 3

I considered using the Microsoft Surface Pro 3 I purchased when Microsoft and Adobe ran a promotion for Adobe Creative Cloud subscribers. Back then, I was enticed by the idea of having a small tablet for photo editing and web development. The Surface did not meet my expectations, as it felt sluggish even with an [Intel Core i7-4650U](https://ark.intel.com/content/www/us/en/ark/products/75114/intel-core-i7-4650u-processor-4m-cache-up-to-3-30-ghz.html) processor.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/surface-pro-3-kubuntu-neofetch.png">
    <img src="/assets/images/surface-pro-3-kubuntu-neofetch.png" class="img-fluid border" alt="neofetch system information output in a terminal window">
    </a>
    <figcaption class="figure-caption text-center">
        neofetch output from a Microsoft Surface Pro 3 running Kubuntu 23.10
    </figcaption>
</figure>

Another weakness of the Surface Pro 3 is that the form factor makes it a horrible device to use on a lap, with the kickstand and flimsy Type Cover. It wouldn't be my secondary laptop, but I still installed [Kubuntu](https://kubuntu.org) 23.10 on the Surface because I could.

### Dell XPS 13 (9350)

Until this past weekend, I had a Dell XPS 13 (9350) laptop I picked up from [Free Geek](https://www.freegeek.org/) in Portland at a low price. That low price came with a cost: the battery had swelled up and needed to be replaced immediately. It also had a flaky keyboard with a cluster of keys that would not register key presses half the time or without slamming down the keys. I used it solely as a Dev Test laptop running [Pop!_OS](https://pop.system76.com) 22.04 LTS. Sadly, it was not going to cut it as a secondary laptop.

Since neither the Surface Pro 3 nor the XPS 13 were usable as a secondary laptop and had enough processing power, memory, or storage as an on-the-go laptop, I wanted to find a newer, thin-and-light laptop with good Linux support. I initially looked for refurbished or discounted [Framework](https://frame.work/) 13 laptops with an 11th or 12th-generation Intel Core processor, but they were all out of stock on the official marketplace.

### Lenovo ThinkPad T14 Gen 3

After researching laptops with official Linux support from the manufacturer, I settled on a Lenovo ThinkPad T14 Gen 3. Although its primary memory is soldered on the board, the laptop does include a memory expansion slot. Lenovo listed Linux and Ubuntu Linux support in the [Product Specifications Reference](https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_T14_Gen_3_Intel/ThinkPad_T14_Gen_3_Intel_Spec.pdf) spec document.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/thinkpad/lenovo-t14-g3-laptop.jpg">
    <img src="/assets/images/thinkpad/lenovo-t14-g3-laptop.jpg" class="img-fluid border" alt="Opened Lenovo ThinkPad T14 Gen 3 laptop">
    </a>
    <figcaption class="figure-caption text-center">
        Lenovo ThinkPad T13 Gen 3 laptop in excellent condition
    </figcaption>
</figure>

I found a T14 Gen 3 listing on eBay for 520 USD in excellent condition. The laptop has an [Intel Core i5-1245U](https://ark.intel.com/content/www/us/en/ark/products/226260/intel-core-i51245u-processor-12m-cache-up-to-4-40-ghz.html)  processor with two performance and eight efficiency cores, 16 GB of soldered RAM, a 256 GB NVMe SSD, and an Intel AX211 wireless module with WiFi 6E support. The 14" display has an aspect ratio of 16:10 and a resolution of 1920x1200.

For another 215 USD, I picked up and installed a Crucial 32 GB memory module and a 2 TB WD Black SN850X NVMe SSD.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/thinkpad/pop-os-neofetch.png">
    <img src="/assets/images/thinkpad/pop-os-neofetch.png" class="img-fluid border" alt="neofetch system information output in a terminal window">
    </a>
    <figcaption class="figure-caption text-center">
        neofetch output from a Lenovo ThinkPad T14 Gen 3 running Pop!_OS 22.04
    </figcaption>
</figure>

On the left side of the laptop is a Gigabit Ethernet port driven by an Intel I219-LM, two USB Type-C Thunderbolt 4 ports, an HDMI 2.0b port, a USB 3.2 Gen 1 Type-A port, and a 3.5mm audio port. A security lock slot and another USB 3.1 Gen 1 Type-A port are on the laptop's right side. Unfortunately, only one of the two USB Type-C ports can be used to charge the laptop. At least the laptop does not use Lenovo's proprietary connector on other notebooks and ultra-small form factor desktops.

The first distro that I tried was Kubuntu 23.10. After installing Kubuntu, I was surprised to see all the hardware was detected and the touch screen was responsive. I ran into an issue that I considered to be a deal-breaker, and that was an issue where lines of white pixels would flash intermittently at the top of the screen when using KDE Plasma with either Xorg or Wayland. The problem also occurred with the KDE Plasma spin of Fedora 39 and KDE Plasma running on Pop!_OS 22.04 LTS. I'll try KDE Plasma after Pop!_OS 24.04 LTS is released or if I decide to distro-hop later.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/thinkpad/pop-os-sys-info.png">
    <img src="/assets/images/thinkpad/pop-os-sys-info.png" class="img-fluid border" alt="System information for a Lenovo ThinkPad T14 Gen 3 running Pop!_OS">
    </a>
    <figcaption class="figure-caption text-center">
        Lenovo ThinkPad T14 Gen 3 system information as shown in Pop!_OS
    </figcaption>
</figure>

Even for a thin-and-light laptop without discrete graphics and a processor with only two performance cores, the T14 Gen 3 is very snappy, and the fans do not spin up except when pushing the processor hard for a few minutes. The integrated Intel Xe GPU works well for my needs since I plan to play something other than modern games on the laptop.

While the keyboard's feel is excellent, with decent travel and key stability, the layout is annoying, especially after using an Apple keyboard layout for a long time. The location of the Print Screen key sitting between the right Alt and Ctrl keys is very sub-optimal; the up arrow key is slightly taller than the down arrow key, and the top row function keys are narrow and squished together to fit in the Home, End, Insert and Delete keys. I prefer if the Home and End keys were overlaid on the left and right arrow keys, making the function keys less squished.

My last complaint with the laptop is that it complains during boot up if you plug it into a USB charger that provides less than a rated 65 W. I understand that charging over USB Type-C can be a mess, and plugging a laptop into a charger with a lower output can be a problem, but it should **not** require intervention during the boot process. What in the world was Lenovo thinking?

### Conclusion

If money were no object, I would have gone with a new Framework 13 with an AMD Ryzen processor and loaded it up for bear. Since it is a secondary laptop and I had to stay within a budget, I'm happy I found the ThinkPad with its build quality, size and weight, and ability to run Linux reliably. I can look past most of the niggles that I have and hope that I can figure out a fix for the random pixel flashing in KDE Plasma.
