---
layout: post
title:  "Installing and Using Fedora on Apple MacBooks with T2 Security Chips"
date:   2026-03-24 20:45:00 -0700
tags:   apple macbook-air macbook-pro linux t2linux fedora
---

Over the years, I have built up a small collection of laptops, mostly ones that I've kept around after being replaced by a new laptop. They have been useful when I need to have a fallback laptop or to try out different software or operating systems. In that collection, I have a Late 2016 15-inch MacBook Pro and a 16-inch 2019 MacBook Pro collecting dust after experimenting with [installing and using Proxmox]({{ site_url }}{% post_url 2025-08-29-installing-proxmox-ve-9-intel-macbook-pros %}) on them last year.

After getting my hands on a 2018 MacBook Air, after a family member replaced it with a new laptop, I figured that I could try running Linux with [t2linux](https://t2linxu.org/) on both the MacBook Air and the 16-inch MacBook Pro, as both have an Apple T2 security chip.

### MacBook Specs

Before diving in, let's take a look at the specs of the two Macbooks that I'll be using.

#### 2018 MacBook Air

The 2018 MacBook Air ([MacBookAir8,1](https://support.apple.com/en-us/111933)) is a base spec model with a dual-core [Intel Core i5-8210Y processor](https://www.intel.com/content/www/us/en/products/sku/189912/intel-core-i58210y-processor-4m-cache-up-to-3-60-ghz/specifications.html) that has a 1.6 GHz base clock and can turbo up to 3.6 GHz, and with a TDP of 7 watts.

Soldered on to the MacBook's logic board is 8 GB of RAM and a 128 GB NVMe SSD. In order to make sure that the MacBook Air could perform at its best, I replaced the seven-year-old thermal paste with a non-electrically conductive, high-performance thermal paste. I also gave the fan a good cleaning and cleaned up all of the dust and stuff that accumulated through its life.

Unfortunately, that era of MacBooks used the butterfly keyboard switches that are problematic. Having used a late 2016 MacBook Pro for several years, I am kind of used to the short key travel and non-existent tactile feel of the keys.

#### 2019 MacBook Pro

The 16-inch 2019 MacBook Pro ([MacBookPro16,1](https://support.apple.com/en-us/111932)) is a well-equipped model with an eight-core [Intel Core i9-9880H](https://www.intel.com/content/www/us/en/products/sku/192987/intel-core-i99880h-processor-16m-cache-up-to-4-80-ghz/specifications.html) that has a base clock of 2.3 GHz and can turbo up to 4.8 GHz.

Soldered on to the logic board is 32 GB of RAM, a 2 TB NVMe SSD, and an AMD Radeon Pro 5500M discrete GPU with 8 GB of GDDR6 memory. Unfortunately, I did not replace the still-original thermal paste as that requires removing the entire logic board in order to take off the heatpipe and heatsink assembly.

One of the reasons why I original purchased the 2019 MacBook Pro was because Apple ditched the butterfly key switches and went back to a more traditional scissor key switches. The slightly larger screen and a slightly thicker form factor allows for an improved thermal solution. Sadly, the improved thermal solution still could not fully handle amount of heat the Intel mobile processors of the time (and that's excluding the discrete GPU that also needs to be cooled).

I jumped over to a 16-inch M1 Max MacBook Pro soon after Apple announced them just to get away from the horrendously inefficient Intel-based Macs.

### Preparing for the Installs

Since I already use Fedora Workstation on both my main and travel laptops (Framework Laptop 16 and Lenovo ThinkPad T14 Gen 3 respectively), I wanted to see how well Fedora Workstation 43 with the t2linux kernel and packages would work. After reading through the documentation on the [t2linux wiki](https://wiki.t2linux.org/), I looked at the [custom builds of the Fedora installers](https://github.com/t2linux/fedora-iso/releases) were available on GitHub. The description listed for the [Fedora 43 release](https://github.com/t2linux/fedora-iso/releases/tag/43.0) mentioned that the installer was broken and the best option was to start with their Fedora 42.2 install ISO and upgrade to Fedora 43.

Since the 2018 MacBook Air that I would be testing this on is a base spec model, with a dual-core Intel Core i5-8210Y with 8 GB of RAM and a 128 GB NVMe SSD, I didn't want to go through the install and upgrade process. Thankfully, the wiki has steps for getting [unsupported spins of Fedora](https://wiki.t2linux.org/distributions/fedora/installation/) up and running with the t2linux kernel and packages.

Before nuking macOS Sonoma from the MacBook, I followed the instructions in the [Wi-Fi and Bluetooth Guide](https://wiki.t2linux.org/guides/wifi-bluetooth/) to extract the firmware for the Wi-Fi and Bluetooth controller on both MacBooks, and created packages for Fedora, Debian and Arch-based distros (in case I wanted to try other distros later). I made several copies of the files and stored them in different spots in the event that I accidentally deleted one of the files somehow.

I repeated that process with the 2019 MacBook Pro since I would be trying things out later on.

For the last preparation step, I booted both the MacBook Air and the 2019 MacBook Pro into Recovery Mode so that I could disable any and all boot security settings, and allowed the MacBook to boot from external media.

### Installing Fedora and t2linux

The Fedora installation instructions noted that the built-in keyboard, trackpad, and the Wi-Fi controller will not work when booted up with an unmodified installer. I used the same trusty Anker PowerShare 6-in-1 USB Type-C hub that I used when trying to get Proxmox working on my older MacBook Pros. I connected the hub's Ethernet connection up to my switch, used a Logitech keyboard with built-in trackpad, and an IODD ST400 drive with various Linux installer ISOs already loaded up.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2018-mba-gnome-fastfetch.png">
            <img src="/assets/images/mac-t2linux/2018-mba-gnome-fastfetch-1280x800.jpg" class="img-fluid border" alt="Fedora Workstation 43 with GNOME desktop running on a 2018 MacBook Air with the fastfetch output displayed in a terminal emulator">
            </a>
            <figcaption class="figure-caption text-center">
                Obligatory fastfetch output from a 2018 MacBook Air running Fedora Workstation 43 with t2linux
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2019-mbp-gnome-fastfetch.png">
            <img src="/assets/images/mac-t2linux/2019-mbp-gnome-fastfetch-1536x960.jpg" class="img-fluid border" alt="Fedora Workstation 43 with GNOME desktop running on a 2019 MacBook Pro with the fastfetch output displayed in a terminal emulator">
            </a>
            <figcaption class="figure-caption text-center">
                Obligatory fastfetch output from a 2019 MacBook Pro running Fedora Workstation 43 with t2linux
            </figcaption>
        </figure>
    </div>
</div>

To boot off of the Fedora installation ISO, I powered up the MacBooks while holding down the `Option` key until the boot media selection screen came up. I selected the Fedora Workstation 43 ISO on the IODD drive and an EFI Boot option appeared with an optical disc icon. After booted into the live installer environment, I clicked on the button to proceed with the installation. On the MacBook Air and the MacBook Pro, it took about 3-4 minutes before the Anaconda Web Installer opened up.

I went through the Fedora installation process the same way that I would do on any other computer. During the first attempt of the installation on the MacBook Air, I chose to use the disk-based encryption, LUKS, to see what impact it had on the MacBook Air's performance and if it caused any issues. The MacBook felt quite sluggish and would fail to suspend or wake up from suspend at all. All later installs do not have disk-based encryption enabled and have the defaults provided by the installer.

After rebooting the MacBooks once the installation was completed, I followed the aforementioned [Wi-Fi and Bluetooth Guide](https://wiki.t2linux.org/guides/wifi-bluetooth/) instructions to install the firmware package I created before nuking macOS, and followed the steps to install the required Copr repository, kernel and t2linux packages for [Fedora-based installs](https://wiki.t2linux.org/distributions/fedora/installation/). Once that has been completed, I reebooted the MacBooks again, then installed any Fedora packages that needed updating.

### Taking the MacBooks for a Spin

Now that the MacBooks have the all of the required packages and updates installed, I started to see which features and functions work and which ones are not working properly. First, pressing the function keys at the top of the keyboard would trigger the multimedia or screen-related shortcuts rather than functioning as normal `F1` through `F12` keys. I looked around online and saw that I had to set `hid_apple.fnmode` from the default of `1` to `2` to change that behavior.

To temporarily change the behavior, run the following command to set the runtime value:

```bash
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
```

To make that change stick on startup in Fedora, I used `grubby` to add a new kernel argument by running:

```bash
sudo grubby --update-kernel=ALL --args="hid_apple.fnmode=2"
```

When I first used the screen brightness up and down function keys, there was a discrepency between what the screen brightness level was in GNOME and what the MacBook thought it was. Everything went back in sync after changing the screen brightness in the Settings application or in the system status dropdown.

Before I could see if video hardware decoding and acceleration worked on both MacBooks, I followed the steps to configure the [RPM Fusion repositories](https://rpmfusion.org/Configuration) and installed the [multimedia packages and drivers from RPM Fusion](https://rpmfusion.org/Howto/Multimedia).

For the MacBook Air, I installed `libva-intel-driver` instead of `intel-media-driver` given the vintage of Intel Core processor that's in the MacBook. For the 2019 MacBook Pro with discrete AMD Radeon graphics, I installed the required AMD Mesa drivers by running documented in the RPM Fusion wiki:

```bash
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
```

To validate that video hardware decoding and acceleration was working correctly, after rebooting the MacBooks, I installed and used the `nvtop` package to monitor GPU usage while watching several YouTube videos from the amazing [Transport Evolved](https://www.youtube.com/@transportevolved) channel.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2018-mba-video-hw-acceleration.png">
            <img src="/assets/images/mac-t2linux/2018-mba-video-hw-acceleration-1280x800.jpg" class="img-fluid border" alt="YouTube video playback on a 2018 MacBook Air running Fedora Workstation 43 with t2linux kernel and multimedia packages from RPM Fusion">
            </a>
            <figcaption class="figure-caption text-center">
                YouTube playback on 2018 MacBook Air with integrated GPU hardware decoding
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2019-mbp-video-hw-acceleration.png">
            <img src="/assets/images/mac-t2linux/2019-mbp-video-hw-acceleration-1536x960.jpg" class="img-fluid border" alt="YouTube video playback on a 2019 MacBook Pro running Fedora Workstation 43 with t2linux kernel and multimedia packages from RPM Fusion">
            </a>
            <figcaption class="figure-caption text-center">
                YouTube playback on a 2019 MacBook Pro with AMD GPU hardware decoding
            </figcaption>
        </figure>
    </div>
</div>

For the 2019 MacBook Pro, the AMD GPU was being used to handle video playback, but the MacBook Air struggled quite badly. When peeking at the "Stats for nerds", I saw that YouTube was sending out AV1 encoded videos and the MacBook Air was just not cut out for that. I found that I could disable AV1 media support by changing the `media.av1.enabled` config key in Firefox from `true` to `false`.

After disabling AV1 support in Firefox, playing the same video again, this time served up as VP9-encoded video, the MacBook Air could playback many 1080p videos pretty well by using the integrated GPU. Videos with a lot of movement and changes between frames would sometimes struggle on the MacBook Air and dropping down the quality to 720p solved that.

Even when watching videos in 1080p or stress testing the CPU by building and install applications on the MacBook Air, the fan ramped up and down as usual based on load and overall system temperature. When I checked to see if the `t2fanrd` service that is used to set fan curves and thresholds, I noticed that the service was failing to start. The error was returning was `Error: Cannot write to fan controller`.

Since the MacBook's fan was working correctly without the service running, I disabled it to reduce the amount of entries spamming the system logs.

The `t2fanrd` service ran without errors on the 2019 MacBook Pro, though I'll cover that later in this post.

### 2018 MacBook Air: Surprisingly Good

After installing additional applications including NextCloud, Visual Studio Code, and QOwnNotes. I started using the MacBook Air for things like web browsing, watching videos, editing documents, and a bit of light development and testing. I was pleasantly surprised at how well it handled most of those tasks.

<div class="row">
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2018-mba-compiling-ghostty.png">
            <img src="/assets/images/mac-t2linux/2018-mba-compiling-ghostty-1280x800.jpg" class="img-fluid border" alt="2018 MacBook Air running Fedora 43 compiling and installing the Ghostty terminal emulator with the s-tui system performance monitoring tool displaying processor usage and system temperatures">
            </a>
            <figcaption class="figure-caption text-center">
                Compiling and installing Ghostty on a 2018 MacBook Air
            </figcaption>
        </figure>
    </div>
    <div class="col col-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2019-mbp-compiling-ruby.png">
            <img src="/assets/images/mac-t2linux/2019-mbp-compiling-ruby-1536x960.jpg" class="img-fluid border" alt="2019 MacBook Pro running Fedora 43 compiling and installing Ruby with the btop monitoring tool displaying processor usage and system temperatures">
            </a>
            <figcaption class="figure-caption text-center">
                Compiling and installing Ruby on a 2019 MacBook Pro
            </figcaption>
        </figure>
    </div>
</div>

Combining the relatively high pixel density of 227 dots per inch (dpi) and setting the display scaling to 133%, text was still clear to read and provided just enough space for a terminal window and a text editor "tiled" side-by-side.

The two things that did dampen the overall experience were the dual-core Intel Core i5-8210Y processor and the 8 GB of RAM that is shared between system and integrated graphics. It did struggled a bit when browsing and using modern, heavy web sites or when using Electron-based applications like Visual Studio Code.

Even with the tired processor, the MacBook Air was able to complete my little torture test of compiling and installing the latest versions of Python 3.14 and Ruby 3.4 via [pyenv](https://github.com/pyenv/pyenv) and [rbenv](https://github.com/rbenv/rbenv), as well as the [Ghostty](https://ghostty.org/) terminal emulator, while still browsing some lighter weight web sites.

Lastly, I wanted to see how well Bluetooth was supported. I didn't have any Bluetooth keyboards or trackballs available, but I was able to pair my Bluetooth headset and listen to music.

I did not need to follow the [Suspend Workaround](https://wiki.t2linux.org/guides/postinstall/#suspend-workaround) steps, as the Wi-Fi and Bluetooth controllers worked after the MacBook woke back up. Out of the dozen or so times that I closed the MacBook Air and came back to it later, anywhere from 5 minutes to a couple of hours, the MacBook only failed to wake up once. Upon waking up, the screen backlight turned on, turned off, then the boot chime came on. I didn't see any specific errors or kernel messages via `journalctl` that provided any insights into why it failed that one time.

With all of that said, I've found myself using the MacBook Air more and more as a laptop in my chair after work rather than the heavy Framework Laptop 16. I will switch over to the Framework when I need to use the larger screen and usable screen real estate, or when I need the extra performance.

### 2019 MacBook Pro: I Have Some Thoughts

As good as running Fedora with t2linux kernel and packages is on the 2018 MacBook Air, I **cannot** say the same for the 2019 MacBook Pro.

I will preface that a portion of the issues and complaints I had running Fedora on the MacBook Pro are due to the decisions that Apple made when designing the MacBook Pro in general, primarily the rather inadequate thermal solution used to cool the wildly inefficient Intel processor and the extra thermal load created by the discrete AMD Radeon GPU.

#### Getting the Touch Bar Working

On the first attempt of installing Fedora Workstation 43 and the t2linux kernel and packages, the Touch Bar did not function, even after installing updates and following the [Touch Bar-related steps](https://wiki.t2linux.org/guides/postinstall/#adding-support-for-customisable-touch-bar) in the t2linux wiki.

<div class="row">
    <div class="col col-10 offset-1">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2019-mbp-working-touch-bar.jpg">
            <img src="/assets/images/mac-t2linux/2019-mbp-working-touch-bar-1280x857.jpg" class="img-fluid border" alt="Touch Bar working on a 2019 MacBook Pro running Fedora Workstation 43 with t2linux kernel and packages">
            </a>
            <figcaption class="figure-caption text-center">
                Touch Bar working under Fedora with t2linux
            </figcaption>
        </figure>
    </div>
</div>

I decided to start over and re-install Fedora and the t2linux kernel and packages, and after rebooting, the Touch Bar was finally working. I'm not sure what happened during the first installation, but I was glad to see the Touch Bar light up, pressing the `Fn` key switched between the `F1` through `F12` keys and the other control keys, and tapping the corresponding key working as expected.

#### Taming Thermals

When running macOS, the hybrid graphics would make use of the integrated Intel GPU for general tasks while leveraging the AMD GPU for more demanding tasks.

There are [several options for tackling hybrid graphics](https://wiki.t2linux.org/guides/hybrid-graphics/) under Linux, including prioritizing the integrated GPU over the discrete GPU. Even though I added the `/etc/modprobe.d/apple-gmux.conf` file, `glx_info` would always report the AMD GPU as the renderer rather than the integrated GPU.

What did help reduce some of the thermal load was to set the `power_dpm_force_performance_level` to `low` from the default of `auto`. The change wasn't immediately apparent when viewing temperatures in `btop` or `s-tui`, but the MacBook felt a little cooler while idling.

On the topic of thermals, I made several tweaks to the `/etc/t2fand.conf` file to try to balance fan speed and noise with the overall temperature of the MacBook. I eventually settled on the following settings for the configuration file:

```conf
[Fan1]
low_temp=50
high_temp=75
speed_curve=logarithmic
always_full_speed=false

[Fan2]
low_temp=50
high_temp=75
speed_curve=logarithmic
always_full_speed=false
```

#### Suspending Suspense

Unlike the MacBook Air, the MacBook Pro had issues going into and out of suspend mode. Trying to put the MacBook into suspend mode using the system status dropdown would cause the MacBook's screen to turn off, but the keyboard backlight and the Touch Bar would stay on. Neither the Touch Bar or the keyboard would respond to wake up the MacBook.

I did experiment with the [Suspend Workaround](https://wiki.t2linux.org/guides/postinstall/#suspend-workaround) steps, but most of those would either cause the MacBook to hard crash upon going into suspend or waking up, or shut the MacBook off completely.

One thing I noticed while the MacBook was shutting down is that the screen turns off along with the Touch Bar and keyboard backlight, but the fans will spin most of the way down for about 30 seconds to a minute. After that, the fans quickly spin up to full speed, then the MacBook seems to power off. Unfortunately, if the lid is closed before it completely powers off, the shutdown process hangs and causes it to heat up dramatically. This causes the fans to spin up and down in speed until I force the MacBook off by holding the power button for 10 seconds.

A couple of times while rebooting the MacBook after installing updates or making system-level changes, the MacBook would hang or crash trying to reboot. I would have to press and hold the power button down for 10 seconds, then boot the MacBook back up.

I ran out of time trying to troubleshoot the issues with suspending, shutting down and reboot the MacBook. At this point, I've put the 2019 MacBook Pro to the side and have moved on to other projects.

### Final Thoughts

Even before trying to run Linux on my MacBooks with the Apple T2 security chip, I had heard both good and bad experience with others trying the same thing with different Linux distros. Maybe I would've had a different experience trying an Arch-based distro or a bootable Debian-based distro on the 2019 MacBook Pro. But, with a limited amount of time that I had, I stuck with my current distro of choice: Fedora.

<div class="row">
    <div class="col col-10 offset-1">
        <figure class="figure">
            <a target="_blank" href="/assets/images/mac-t2linux/2018-mba-fedora-sticker.jpg">
            <img src="/assets/images/mac-t2linux/2018-mba-fedora-sticker-1280x901.jpg" class="img-fluid border" alt="2018 MacBook Air in Gold with a Powered by Fedora sticker">
            </a>
            <figcaption class="figure-caption text-center">
                2018 MacBook Air wearing the Powered by Fedora badge of honor
            </figcaption>
        </figure>
    </div>
</div>

Right now, I have welcomed the 2018 MacBook Air to the collection of the laptops that I regularly use. While it's not a laptop that I will travel with, installing and using Fedora has helped extend its useful life. Although Apple still releases security updates and some bug fixes for macOS Sonoma, the final version of macOS the MacBook supports, that will eventually come to an end.

With Fedora (or any other t2linux-supported Linux distro), the MacBook Air will continue to gain features and improvements as new versions are released. Also, there will continue to be updates and fixes introduced with each commit made to the [t2linux](https://t2linux.org/) project's packages and kernel patches.

I have included the output of `lspci`, `lsusb` and `/proc/cpuinfo` for both MacBooks in case that helps provide any useful bit of information to anyone.

<div class="row">
    <div class="col col-4">
        <h5>2018 MacBook Air</h5>
        <ul>
            <li><a href="/assets/text/mac-t2linux/2018mba-lspci.txt"><code>lspci</code> output</a></li>
            <li><a href="/assets/text/mac-t2linux/2018mba-lsusb.txt"><code>lsusb</code> output</a></li>
            <li><a href="/assets/text/mac-t2linux/2018mba-cpuinfo.txt"><code>/proc/cpuinfo</code> output</a></li>
        </ul>
    </div>
    <div class="col col-4">
        <h5>2019 MacBook Pro</h5>
        <ul>
            <li><a href="/assets/text/mac-t2linux/2019mbp-lspci.txt"><code>lspci</code> output</a></li>
            <li><a href="/assets/text/mac-t2linux/2019mbp-lsusb.txt"><code>lsusb</code> output</a></li>
            <li><a href="/assets/text/mac-t2linux/2019mbp-cpuinfo.txt"><code>/proc/cpuinfo</code> output</a></li>
        </ul>
    </div>
</div>
