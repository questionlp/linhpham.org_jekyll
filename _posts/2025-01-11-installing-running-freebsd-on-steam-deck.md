---
layout: post
title:  "Installing and Running FreeBSD on a Steam Deck"
date:   2025-01-11 14:30 -0800
tags:   freebsd steam-deck hardware
---

After receiving my [Steam Deck](https://store.steampowered.com/steamdeck) OLED and getting my games installed on it, my old 256 GB Steam Deck started to collect dust. I originally thought about having it permanently docked and connected to my TV as an emulation system, but I ended up falling back to the MiSTer or playing older games on original hardware.

Instead of letting it continue to collect dust, I had the idea of replacing the original SSD with a larger one and installing [Bazzite](https://bazzite.gg/) on it to get a good feel of how well it works on a handheld console, much less a Steam Deck. While I waited for the new SSD to arrive, I decided have some fun: installing and using [FreeBSD](https://www.freebsd.org/) on a Steam Deck.

The motivation for doing so came from seeing a [Steam Deck](https://wiki.freebsd.org/Laptops/Steam_Deck) page on the [FreeBSD Wiki](https://wiki.freebsd.org) with some information on what hardware was detected and what hardware was marked as working.

### Some FreeBSD BG on Me

For over a decade, I was an ardent fan and user of FreeBSD. I ran it on servers at work, ran it on servers at home and in the cloud (rest in peace, RootBSD), helped edit and write articles for the BSD-centric site called [Daemon News](http://www.daemonnews.org/). I even [covered](https://static.closedsrc.org/articles/dn-articles/oscon2003.html) the first time the Open Source Convention (OSCON) came to Portland, Oregon using an IBM ThinkPad laptop running FreeBSD. And, for a time, I even had a site called [BSDNotLinux.org](https://web.archive.org/web/20060129211044/http://bsdnotlinux.org/) that featured companies that promoted or even used BSD operating systems.

Another little tidbit, the [first versions of the Wait Wait Stats Page](https://stats.wwdt.me/site-history) ran on FreeBSD installed on a Compaq iPaq desktop.

My use of FreeBSD would wane over the years as I started to support and manage Linux servers at work and the availability of cloud providers that provided or even minimally supported FreeBSD cloud servers thinned out.

### Getting Ready to Install FreeBSD

With the Steam Deck only having a single USB Type-C port available for connect the device to power and for plugging in peripherals that will be needed to install FreeBSD (or any other operating system), I used an [Anker PowerExpander (or 543) 6-in-1 USB hub](https://www.anker.com/products/a8365). The hub has a regular USB Type-C port, a USB Type-C power that passes through USB Power Delivery to charge the Steam Deck, an HDMI port, two USB Type-A ports, and a Gigabit Ethernet adapter. You will need a USB keyboard at minimum to run commands from the command-line and a USB mouse for work within a graphical environment.

Although the official [Steam Deck Dock](https://store.steampowered.com/steamdeckdock) has a similar port arrangement (with one extra USB Type-A port and a full-sized DisplayPort output), I only used it for a short amount of time to connect the Steam Deck to my TV.

Other USB hubs may work with FreeBSD, but you mileage may vary due to a smaller list of supported devices.

For the first round of installing FreeBSD on the Steam Deck, I used an IODD SATA SSD enclosure that I keep different operating system ISO images on. Unfortunately, there were intermittent issues where the virtual CD-ROM feature would drop out or time out on I/O requests. I ended up burning the FreeBSD 14.2 Install DVD 1 ISO image on a spare USB thumb drive and that worked without any issues. I didn't try Ventoy, so your mileage may vary.

I also do not have a 64 GB eMMC M.2 module that Steam used on their original base model to test out; but, I will cover using a microSD card to run FreeBSD on the Steam Deck later on.

Of course, if you do want to try to install FreeBSD (or any other operating system) on to your Steam Deck, make sure that you've saved off any data on to Steam Cloud or backup files on to a USB thumb drive or microSD card before doing anything. Installing FreeBSD on the internal drive will wipe it out and things can go wrong when running FreeBSD off of a microSD card. You have been warned.

### It's Installation Time

After connecting a USB keyboard, USB boot device, the Steam Deck power cable and a network cable to the USB hub, and connecting the hub to the USB port on the Steam Deck, I powered on the Steam Deck while holding down the **Volume Down** button and momentarily pressing the **Power** button. You should see the Steam Deck logo appear on the screen and then the boot menu with a list of boot options.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/steam-deck-freebsd/freebsd-boot-menu.jpeg">
    <img src="/assets/images/steam-deck-freebsd/freebsd-boot-menu.jpeg" class="img-fluid border" alt="FreeBSD boot menu on a Steam Deck">
    </a>
    <figcaption class="figure-caption text-center">
        FreeBSD boot menu loaded on a Steam Deck from a FreeBSD 14.2 installer ISO
    </figcaption>
</figure>

### Installing FreeBSD on the Internal NVMe Drive

In the boot menu, select the USB boot device with the FreeBSD installer and press the `A` button on the Steam Deck (or `ENTER` on the keyboard). After a few moments, a FreeBSD boot menu should appear on the screen and will continue on loading up the text-based installer. The text on the screen will be rotated 90 degrees counter/anti-clockwise and rotating the Steam Deck clockwise should make viewing the text easier.

During each prompt of the installer, I selected the default options for most of the items, including using the ZFS file system, entering in the appropriate network settings for the USB Ethernet adapter, `ue0`, and setting up a separate user account. You shouldn't need to install any of the source or debug packages when prompted, though the Ports Collection may be useful if you want to compile and install applications not available via the pre-built FreeBSD packages. I also made sure to enable the use of `powerd` to have some power management available on the device, though I don't know how effective it is.

Even though the installer will display a `rtw880` network device for the integrated wireless adapter and it may be able to scan and display the nearby wireless networks, it is highly likely that it will **not** be able to connect to any of them. More on that later on.

Once you have finished going through the installation process, you can now exit the installer and reboot the system. You will also want to remove the USB boot device while the FreeBSD installation environment shuts down. The Steam Deck should boot up normally, the FreeBSD boot menu should appear and continue booting.

#### Installing FreeBSD on a microSD Card

If you want to run FreeBSD on a Steam Deck from a microSD card, you will want to image a microSD card using the virtual machine images that FreeBSD provides. Specifically, you will need to download either the UFS raw image or the ZFS raw image, depending on which file system you want to use on the card. The latest downloads for 14.2 are available at <https://download.freebsd.org/releases/VM-IMAGES/14.2-RELEASE/amd64/Latest/>. If you are reading this post sometime in the future, the links to virtual machine image files are available on the [FreeBSD download page](https://www.freebsd.org/where/).

You can use [Balena Etcher](https://etcher.balena.io/), [Raspberry Pi Imager](https://www.raspberrypi.com/software/), [Rufus](https://rufus.ie/en/) or good ol' `dd` to write the (uncompressed) image file to a microSD card. I would recommend on using a card that is at least 32 GB in size and one with the highest minimum read and write speeds available. A good reference would be Explaining Computer's [Explaining SD Cards: 2025 Update](https://www.youtube.com/watch?v=HtgIHfqQiC8) video.

After I imaged the UFS raw image on to a 32 GB Samsung microSD card, inserted it into the Steam Deck, booted the system into the boot menu, and selected the "EFI SD/MMC Card" option, I was able to boot into FreeBSD and it automatically resized the partitions to fill up the SD card. You mileage may vary if you use the ZFS raw image.

The default password for the root user is blank and should be changed upon first login.

I did try using the FreeBSD installer to install the operating system on the same microSD card, but it would hang after selecting the drive.

### Initial Configuration

After the rest of the operating system boots up and a login prompt appears, log into the Steam Deck either as `root`, or the additional account that you may have created during the installation process. All of the steps to get the system working will require superuser privileges and `sudo` is not installed as part of the base system.

Before you can use the `pkg` package manager to install additional packages, you will need to confirm that the `ue0` network interface has been activated and connected to your network. Run `ifconfig ue0` to show the status of the interface and the IP address either statically assigned or provided via DHCP.

If you do not see that the `ue0` interface is configured correctly, you will need to edit the `/etc/rc.conf` file and make sure that there is an entry for `ifconfig_ue0`. This should be set to `DHCP` if you want to use DHCP, or the appropriate static configuration as documented in the [Networking](https://docs.freebsd.org/en/books/handbook/network/) section of the [FreeBSD Handbook](https://docs.freebsd.org/en/books/handbook/).

Once you have verified that you have network connectivity and can access the Internet, you will probably want to install the first set of tools to make life a little easier. To install the `pkg` package manager, run `pkg` as root. This will prompt you to confirm that you want to install the package manager.

After it has finished downloading and installing, run the following command to get some more common tools available on most base Linux distributions:

```bash
pkg install sudo vim bash
```

Once `sudo` has been installed, run `visudo` to configure the settings to your liking. If you have a separate user account, you will want to make sure it is part of the `wheel` group and uncomment the appropriate line while running `visudo`. The `bash` shell is installed under `/usr/local/bin/bash` and you can set your non-root account to use it by running `chsh -s /usr/local/bin/bash <username>` (replacing `<username>` with the actual username).

If you enabled `powerd` during the FreeBSD installation process, you may want to tweak the profile a little bit. The default when the device is plugged in is `hiadaptive` while `adaptive` tends to be the default when on battery power. To have `powerd` explicitly run using adaptive settings for all profiles, run the following commands as root:

```bash
sysrc powerd_flags="-a adaptive -b adaptive -m adaptive"
service powerd restart
```

### Installing a Graphical Environment

I was successful in installing and using both KDE Plasma 5 and GNOME 42 that are available as pre-built packages. While KDE Plasma 5 could run using Wayland, it is supported with [some additional configuration](https://docs.freebsd.org/en/books/handbook/wayland/), per the FreeBSD Handbook. I only used KDE and GNOME with Xorg, which are the default options.

#### Installing AMD GPU Kernel Modules

Before Xorg can be usable under FreeBSD on the Steam Deck, you will need to install the `drm-kmod` package and add the `amdgpu` module to the kernel module load list. To do both, run the following commands and reboot your Steam Deck.

```bash
pkg install drm-kmod
sysrc kld_list+=amdgpu
```

The `drm-kmod` package will install other kernel modules that are used for other GPUs in addition to the `amdgpu` module that includes the appropriate drivers and binaries for the GPU onboard the Steam Deck's custom AMD Ryzen APU.

#### Installing KDE Plasma

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/freebsd-sddm.jpeg">
            <img src="/assets/images/steam-deck-freebsd/freebsd-sddm.jpeg" class="img-fluid border" alt="KDE Plasma login screen running on a Steam Deck with FreeBSD">
            </a>
            <figcaption class="figure-caption text-center">
                KDE Plasma SDDM login screen, but with the display orientation in portrait mode instead of landscape mode
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/freebsd-kde-desktop.jpeg">
            <img src="/assets/images/steam-deck-freebsd/freebsd-kde-desktop.jpeg" class="img-fluid border" alt="KDE Plasma desktop running on a Steam Deck with FreeBSD">
            </a>
            <figcaption class="figure-caption text-center">
                KDE Plasma desktop with the correct landscape display orientation
            </figcaption>
        </figure>
    </div>
</div>

To install Xorg, KDE Plasma 5, the SDDM graphical login program, and Firefox using the pre-built FreeBSD packages, run the following command as a superuser:

```bash
pkg install xorg kde5 sddm firefox-esr
```

After the packages are installed, several configuration changes will be needed to run KDE and to enable SDDM. To enable both D-Bus and SDDM on startup, run the following commands to add the necessary entries to `/etc/rc.conf`:

```bash
sysrc dbus_enable="YES"
sysrc sddm_enable="YES"
```

Also, you will need to add set `sysctl` tunables. To set the tunables at runtime, run the following commands:

```text
sysctl net.local.stream.recvspace=65536
sysctl net.local.stream.sendspace=65536
```

In order to set both tunables at startup, edit the `/etc/sysctl.conf` file and add the following lines:

```text
net.local.stream.recvspace=65536
net.local.stream.sendspace=65536
```

At this point, it will want to reboot to get everything up and running. After rebooting, you should be greeted with the SDDM graphical login manager, though the display will not be in the correct orientation. You can change it for your user session by going into the KDE System Settings program and changing it under the display settings. The correct orientation option should be the monitor with the base pointing to the left, which will rotate the display clockwise.

There should be a way to apply those settings to SDDM by search for "SDDM" in the System Settings program and applying display or style settings.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/kde-konsole-neofetch.png">
            <img src="/assets/images/steam-deck-freebsd/kde-konsole-neofetch.png" class="img-fluid border" alt="neofetch output in a Konsole terminal window">
            </a>
            <figcaption class="figure-caption text-center">
                neofetch output showing system information for the Steam Deck running FreeBSD 14.2
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/kde-system-settings-about.png">
            <img src="/assets/images/steam-deck-freebsd/kde-system-settings-about.png" class="img-fluid border" alt="Hardware and software information displayed in KDE Plasma System Settings">
            </a>
            <figcaption class="figure-caption text-center">
                KDE Plasma System Settings showing hardware and software information
            </figcaption>
        </figure>
    </div>
</div>

KDE does not provide the ability to change power profiles from the System Settings program, as well as adjusting the internal display brightness. The display brightness *can* be changed from the "Battery and Brightness" item in the Status and Notifications tray, but power profiles are not available.

Interestingly, the Firefox icon pinned in the Task Manager at the bottom of the screen usually shows as a blank page icon until Firefox is launched.

#### Installing GNOME

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/freebsd-gdm.jpeg">
            <img src="/assets/images/steam-deck-freebsd/freebsd-gdm.jpeg" class="img-fluid border" alt="GNOME login screen on a Steam Deck running FreeBSD">
            </a>
            <figcaption class="figure-caption text-center">
                GNOME GDM login screen with the correct display orientation
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/freebsd-gnome-desktop.jpeg">
            <img src="/assets/images/steam-deck-freebsd/freebsd-gnome-desktop.jpeg" class="img-fluid border" alt="GNOME Activities view on a Steam Deck running FreeBSD">
            </a>
            <figcaption class="figure-caption text-center">
                GNOME Activities view with the correct display orientation
            </figcaption>
        </figure>
    </div>
</div>

To install Xorg, GNOME, the GDM graphical login program, Firefox ESR, and the Alacritty terminal emulation program using the pre-built FreeBSD packages, run the following command as a superuser:

```bash
pkg install xorg gnome gdm firefox-esr alacritty
```

After the packages are installed, several configuration changes will be needed to run GNOME and to enable GDM. To enable both D-Bus and GDM on startup, run the following commands to add the necessary entries to `/etc/rc.conf`:

```bash
sysrc dbus_enable="YES"
sysrc gdm_enable="YES"
```

Although not strictly necessary for GNOME, you may want to need to set two `sysctl` tunables. To set the tunables at runtime, run the following commands:

```text
sysctl net.local.stream.recvspace=65536
sysctl net.local.stream.sendspace=65536
```

In order to set both tunables at startup, edit the `/etc/sysctl.conf` file and add the following lines:

```text
sysctl net.local.stream.recvspace=65536
sysctl net.local.stream.sendspace=65536
```

At this point, it will want to reboot to get everything up and running. After rebooting, you should be greeted with the GDM graphical login manager. Both GDM and GNOME should automatically use the correct display orientation.

The reason why you may want to use Alacritty over the default GNOME terminal program is the latter has some text rendering issues out of the box and it may not have some of the more recent features found in newer versions of GNOME. Alacritty sometimes doesn't update the terminal after a command is run or when using tab-completion.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/gnome-alacritty-btop.png">
            <img src="/assets/images/steam-deck-freebsd/gnome-alacritty-btop.png" class="img-fluid border" alt="btop system utilization in an Alacritty terminal window">
            </a>
            <figcaption class="figure-caption text-center">
                System utilization shown by btop running in Alacritty
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/gnome-settings-about.png">
            <img src="/assets/images/steam-deck-freebsd/gnome-settings-about.png" class="img-fluid border" alt="GNOME Settings About page with system information">
            </a>
            <figcaption class="figure-caption text-center">
                Hardware and software information displayed in the GNOME Settings About page
            </figcaption>
        </figure>
    </div>
</div>

GNOME does not provide the ability to change display brightness or power profiles either from the Settings program or from the system status area. The internal display will run at 100% brightness, unless dimmed due to inactivity.

Logging out of GNOME did cause the system to become unresponsive and gave me a blank screen. A forced shutdown and restart of the Steam Deck was needed to get back into the the desktop. Also, with a wireless USB keyboard dongle, the Steam Deck did not wake up with any key presses. I had to tap the power button to wake the Steam Deck back up. This could be due to something with the USB dongle.

### How About That Wireless Networking?

Even after spending several long hours trying to get the integrated Realtek wireless adapter to connect to various wireless networks at home, including several off of my UniFi access point and several off of my old Apple AirPort Extreme, I was not able to get the adapter to do more than see the available networks.

When trying to get the wireless adapter working, I aliased the default `rtw880` interface to `wlan0` and set the country and regulatory domain to United States and FCC by adding the following lines to `/etc/rc.conf`:

```text
wlans_rtw880="wlan0"
create_args_wlan0="country US regdomain FCC"
ifconfig_wlan0="WPA SYNCDHCP"
```

The man page for `rtw` mentioned adding the following line to `/boot/loader.conf` in order to get the interface working:

```text
compat.linuxkpi.skb.mem_limit=1
```

I also defined the wireless network in `/etc/wpa_supplicant.conf` using the following:

```text
network={
    ssid "SSID"
    psk "Pre-shared Key or Passphrase"
    priority 0
}
```

I tried using the default interface and firmware modules included with the base installation, as well as the additional firmware packages that can be installed from `net/wifi-firmware-kmod` (either as a pre-built package or from the Ports Collection).

No matter which module and firmware are installed or used, the wireless interface will always show `NO CARRIER` and will sometimes show the wireless network's SSID in the `ifconfig wlan0` output, but it will eventually switch to a blank SSID.

At this point, I've run out of time and energy to get integrated wireless adapter working on the Steam Deck. Outside of using a USB Ethernet adapter, the only other option would be to use a USB wireless adapter that is supported by FreeBSD. I don't have any current recommendations for which wireless adapters to use, unfortunately.

### Additional Notes

The following list are a couple of other notes and observations that I've collected when running FreeBSD 14.2 on a Steam Deck.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/kde-firefox-youtube-video.png">
            <img src="/assets/images/steam-deck-freebsd/kde-firefox-youtube-video.png" class="img-fluid border" alt="Veronica Explains YouTube video playing in Firefox">
            </a>
            <figcaption class="figure-caption text-center">
                Watching a <a href="https://www.youtube.com/watch?v=uL7KvRskeog">Veronica Explains video</a> on the <code>column</code> command in Firefox
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/steam-deck-freebsd/firefox-full-screen-youtube-video.jpeg">
            <img src="/assets/images/steam-deck-freebsd/firefox-full-screen-youtube-video.jpeg" class="img-fluid border" alt="Stats for nerds displayed while playing a YouTube video in Firefox">
            </a>
            <figcaption class="figure-caption text-center">
                View YouTube "Stats for nerds" information for the same <a href="https://vkc.sh/">Veronica Explains</a> video in Firefox
            </figcaption>
        </figure>
    </div>
</div>

- Some of the integrated Steam Deck buttons have some function, while others do not seem to map to anything specific
  - The directional pad map to the up, down, left and right arrow keys
  - The `View` button (between the directional pad and the left thumb stick) maps to the `TAB` key
  - The `A` button maps to the `ENTER` key
  - The `B` button maps to the `ESC` key
- The Ethernet adapter built into the official Steam Deck Dock intermittently worked and dropped out several times under heavy load. Other USB Ethernet adapters, like the one in the Anker USB hub that I used, may be less flaky or buggy.
- Neither the built-in speakers or the built-in headphone jack output any audio. Audio does come out of the HDMI port when the "AMD R6xx (HDMI)" audio device labeled in KDE Plasma as `2` (`pcm2`) is selected.
- I was able to get audio output to a headphone using a [UGREEN USB-C to 3.5mm Audio Adapter](https://www.amazon.com/gp/product/B082WG5VTK). The device did not show up as an audio device until I plugged my headphone into the adapter.
- The fans rarely spin completely down, even when `powerd` is configured to use the `adaptive` profile mentioned earlier in this post. In the default `hiadaptive` profile, the fans seemed to run at least at medium speed and ramping up under moderate load while in KDE or GNOME.
- The AMD GPU kernel modules seem to allow for near-perfect 4K YouTube video playback to a 4K display or to the integrated display in Firefox. I did not check any other browser.
- Trying put the Steam Deck in hibernation causes the Steam Deck to power off and does not resume.
- Sleep in KDE and suspend in GNOME seems to work initially, but I've seen graphical corruption happen after waking the Steam Deck and authenticating with SDDM or GDM.

### Closing Thoughts

Even though I installed FreeBSD on my Steam Deck mostly for fun or as a meme, I was surprised at what did work out of the box without having to compile a custom kernel or upgrade to `-CURRENT`. I was disappointed at the lack of working built-in audio and the integrated wireless adapter not working as it should.

Both of those mean that using FreeBSD on a Steam Deck as a portable device is quite hampered without living the dongle life. The minimal power management and locked in full screen brightness would also affect battery life, even though I was able to use the Steam Deck for about 30-40 minutes on battery (with 25% remaining) when I forgot to plug in the official power adapter into the USB hub. If power management and screen brightness could be optimized, maybe it could eke out over an hour.

Since I've migrated to Linux as my primary operating system, it is feasible that I could get a some of my Python development, web browsing, media consumption, and basic productivity work done on the Steam Deck running FreeBSD.

Some of the issues with KDE and GNOME could be resolved by building newer versions from the Ports Collection or using a different desktop environment or window manager. Unfortunately, the latest GNOME version in the Ports Collection is 42.5 and the latest version of KDE Plasma 6 is a pre-release version.

Gaming on FreeBSD running on a Steam Deck will be just about the same as gaming on FreeBSD in general. With most of the non-Windows PC gaming being focused on Linux and/or Valve's Proton, the options for triple-A gaming is probably quite limited. While open source games or games built with open source toolkits and frameworks will have a better chance of running on FreeBSD, it would still be a rather limited subset.

Knowing that I could run FreeBSD off of a microSD card after I replace the SSD and install Bazzite on to the Steam Deck means that I can still tool around and re-live some of my great memories of running and advocate for FreeBSD (along with OpenBSD and NetBSD).

### Kudos and Thanks

One last thing that I want to add is that I've always been absolutely grateful to the FreeBSD documentation team for having really great documents, including the FreeBSD Handbook. It was true back when I was fully into the BSD world and it is still true today. You can support the work on and around FreeBSD by [donating to the FreeBSD Foundation](https://freebsdfoundation.org/donate/). A huge thanks to the project members, the volunteers, and the FreeBSD Foundation, as I couldn't have gotten here without y'all.

### Resources

- [FreeBSD Forums: driver rtw88 wifi RTL8821CE](https://forums.freebsd.org/threads/driver-rtw88-wifi-rtl8821ce.93184/)
- [FreeBSD Handbook: Desktop Environments](https://docs.freebsd.org/en/books/handbook/desktop/)
- [FreeBSD Handbook: The X Window System](https://docs.freebsd.org/en/books/handbook/x11/)
- [FreeBSD Wiki: Realtek RTW88](https://wiki.freebsd.org/WiFi/Rtw88)
- [FreeBSD Wiki: Steam Deck](https://wiki.freebsd.org/Laptops/Steam_Deck)
- [Hardware for BSD: Valve Jupiter](https://bsd-hardware.info/?probe=7be0869603)
