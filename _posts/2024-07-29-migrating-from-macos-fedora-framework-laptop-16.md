---
layout: post
title:  "Migrating from macOS to Fedora with a Framework Laptop 16"
date:   2024-07-29 12:00:00 -0700
tags:   linux hardware laptops
---

It has been several weeks since my "[Two Weeks with a Framework Laptop 16]({% post_url 2024-07-04-two-weeks-with-framework-laptop-16 %})" post, in which I wrote about getting a Framework laptop and provided my thoughts on the hardware side of the laptop.

As I write this post, I have used Fedora on the Framework laptop for over a month. In this post, I'll cover installing the KDE spin of Fedora Workstation 40, some customizations I've made to ease the transition from macOS to Fedora, and some applications I have switched to using.

### Installing Fedora

Unlike the previous Fedora installations, where the laptops or virtual machines only have one drive, the new Framework laptop has two drives. My initial plan was to use the larger 4 TB M.2 NVMe drive for the operating system and the 1 TB M.2 NVMe drive for my home directory, with both drives encrypted using LUKS.

Unfortunately, my attempts to configure the drives that way using the Fedora installer ran into several issues. One of the tries left my laptop unusable after the installation, where LUKS would fail to decrypt the drives.

I ended up installing Fedora on the 4 TB drive and encrypting it with LUKS, then setting up the 1 TB drive for storing non-sensitive files.

If I had more time to investigate the issues and troubleshoot, I may have found a better solution. I may revisit it later if I change out the drives, upgrade the mainboard when the next generation of AMD mobile processors becomes available, or switch Linux distributions.

### Fedora Post-Installation Setup

I won't go into details about installing the initial set of packages or the dependencies for building, developing, and testing Python, Ruby, and Node.js applications. I have [published a document](https://github.com/questionlp/framework-laptop-16/blob/main/prepping-fedora-for-web-development.md) on GitHub of those steps.

Since Fedora does not include non-free multimedia codecs with their installers or package repositories, I had to install them and packages to enable hardware-accelerated video encoding and decoding from RPM Fusion. I have detailed the steps in a document called [Installing OpenH264 and Mesa from RPM Fusion](https://github.com/questionlp/framework-laptop-16/blob/main/installing-openh264-and-mesa-from-rpmfusion.md) posted on GitHub.

### Migrating Data and New Applications

Part of migrating from macOS to Linux includes determining which applications to use instead of those only available on macOS. Some application choices were easy, such as replacing Microsoft Office with [LibreOffice](https://www.libreoffice.org/) and Safari with Firefox (along with [Vivaldi](https://vivaldi.com/) and [Ungoogled Chromium](https://github.com/ungoogled-software/ungoogled-chromium) for testing with Chromium-based browsers). Others took a little longer to settle on a replacement.

Applications such as Visual Studio Code, PyCharm, draw.io Desktop, Slack, Discord, Audacity, and OBS Studio are already available on Linux, so there is no need to find a replacement for those applications.

#### Mail, Contacts and Calendar

On macOS, I use the included and default applications for e-mail, contacts, and calendars as they do what I need them to do and not much else.

When using Fedora or Debian on my ThinkPad laptops, I used [GNOME Evolution](https://gitlab.gnome.org/GNOME/evolution) for e-mail, contacts, and calendars because it provided an easy way to connect to my e-mail, contacts, and calendars on Apple iCloud. I only needed an application-specific password for Evolution in my Apple iCloud account.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/framework-fedora/thunderbird.png">
    <img src="/assets/images/framework-fedora/thunderbird.png" class="img-fluid border" alt="Thunderbird e-mail client">
    </a>
    <figcaption class="figure-caption text-center">
        Thunderbird e-mail client running in KDE Plasma
    </figcaption>
</figure>

I used Evolution on the Framework laptop for the first few weeks before switching to [Thunderbird](https://www.thunderbird.net/). While Evolution worked for what I needed, its limited customizability meant I couldn't set it up to look and work how I wanted it to.

Getting iCloud contacts to work in Thunderbird was as simple as adding a CardDAV account, entering my iCloud e-mail address, and `https://contacts.icloud.com/contacts/` for the CardDAV location.

Unfortunately, adding my iCloud calendars to work in Thunderbird took a lot more work. I used the [tutorial](https://frightanic.com/apple-mac/thunderbird-icloud-calendar-sync/) written by Marcel Stör to add each of the iCloud calendars that I have, including a couple of shared calendars.

#### File Syncing, Documents, and Notes

For document and file syncing, I have been using Dropbox for a long time and started transferring some documents onto Apple iCloud after I stopped using Windows regularly at home.

While there is an official Dropbox client for Linux, it only handles file synchronization and provides no graphical user interface for showing status or integrating with file managers. Apple iCloud has no official Linux support.

I decided to set up an instance of NextCloud using the [official all-in-one installation process](https://github.com/nextcloud/all-in-one) on a Debian instance. I installed the official NextCloud client AppImage on my Linux laptops and the official apps for macOS and iOS on my Apple devices.

Eventually, I'll set up additional accounts on the NextCloud server to migrate the shared calendars and contacts from iCloud.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/framework-fedora/qownnotes.png">
    <img src="/assets/images/framework-fedora/qownnotes.png" class="img-fluid border" alt="QOwnNotes note-taking application">
    <figcaption class="figure-caption text-center">
    </a>
        QOwnNotes note-taking application for creating and organizing notes written in Markdown
    </figcaption>
</figure>

To replace the Apple Notes application, I used [QOwnNotes](https://www.qownnotes.org/) because of its native integration with Git and NextCloud. QOwnNotes is also available for macOS and Windows. I installed the NextCloud Notes app for the iPhone, which is thread-bare but works in a pinch.

#### AirDrop and iPhone Integration

One of the benefits of the tight integration between macOS and iOS is the seamless file transfer and data sharing via AirDrop, clipboard sharing feature, call handling, and message notifications.

I'm glad that [KDE Connect](https://kdeconnect.kde.org/), included in the KDE spin of Fedora, provides some of those features through the [official iOS app](https://apps.apple.com/app/kde-connect/id1580245991). If you use GNOME or a GNOME-based desktop environment, [GSConnect](https://github.com/GSConnect/gnome-shell-extension-gsconnect?tab=readme-ov-file) implements the KDE Connect protocol.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/framework-fedora/kde-connect.png">
    <img src="/assets/images/framework-fedora/kde-connect.png" class="img-fluid border" alt="KDE Connect configuration in System Settings">
    </a>
    <figcaption class="figure-caption text-center">
        Settings and options for an iPhone paired with KDE Connect
    </figcaption>
</figure>

KDE Connect supports clipboard sharing, sending and receiving files and photos, pinging the phone from the laptop, and using my iPhone as a virtual trackpad and keyboard.

However, it sometimes takes some time for the KDE Connect app on the phone to see my laptop or vice versa. I also miss getting text messages or phone notifications forwarded to the laptop, which is helpful when receiving one-time passwords via text.

#### Graphical Database Tools

I use either [Sequel Ace](https://sequel-ace.com/) or [Querious](https://www.araelium.com/querious) to query and manage data stored in MySQL databases on my MacBook Pro. Both programs are lightweight and easy to use, support multiple windows open, and allow you to view and edit long-text fields in a pop-up or pop-out dialog.

On Linux, I have resorted to using [JetBrains DataGrip](https://www.jetbrains.com/datagrip/), part of the JetBrains [All Products Pack](https://www.jetbrains.com/all/) subscription. DataGrip supports many database engines, including MySQL, PostgreSQL, Oracle, and SQLite. My biggest complaint about DataGrip is that it always feels heavy and slow to respond, even on fast computers and locally hosted database servers.

I have looked at other applications, such as Navicat, and the ones that get close to the workflow that I'm used to with Sequel Ace or Querious are not free-as-in-beer. I wanted to avoid paying for another product when I already had a JetBrains subscription.

#### Running Virtual Machines

On my Macs, I have been using [VMware Fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion) to run various virtual machines for DevTesting my Wait Wait Stats web applications, running MySQL, or having fun testing different operating systems.

I also had [Parallels Desktop Pro Edition](https://www.parallels.com/products/desktop/pro/) installed on the M1 Max MacBook Pro when virtualization on Apple Silicon was still in its infancy. I eventually dropped the Parallels subscription after VMware Fusion matured and later when it became free for personal use.

Previously, I tried using [VirtualBox](https://www.virtualbox.org/) and found it too clunky, and more recent versions have user interface annoyances. I later tried [GNOME Boxes](https://apps.gnome.org/Boxes/) when trying out Pop!_OS, Debian, and Fedora. Although I found Boxes easy to use, it has some of the same trappings as other GNOME applications: customization is too limited.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/framework-fedora/virt-manager.png">
    <img src="/assets/images/framework-fedora/virt-manager.png" class="img-fluid border" alt="Console display for a Debian virtual machine running with QEMU/KVM">
    </a>
    <figcaption class="figure-caption text-center">
        Virtual Machine Manager console display for a Debian virtual machine
    </figcaption>
</figure>

That's when I learned about [Virtual Machine Manager (aka virt-manager)](https://virt-manager.org/) and switched over to using it before getting my Framework laptop. The user interface and virtual machine configuration workflow took a little while to get used to, but I'm still using it now.

### Making Tweaks to the Framework Laptop 16

#### Customizing the Keyboard

Having used MacBook Pro keyboards for over a decade, trying to type or use other laptop keyboards can be frustrating regarding keyboard layout.

The location of the `Fn` key, `Command`, `Option`, `Ctrl`, and `Alt` keys on many non-Apple laptops usually trips me up for a long time, and there's only so much key swapping you can do in software. When I heard that the keyboards for the Framework Laptop 16 can be customized using QMK/VIA, I knew I had to make a couple of changes.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/framework-fedora/framework-via.png">
            <img src="/assets/images/framework-fedora/framework-via.png" class="img-fluid border" alt="VIA keyboard programming web application">
            </a>
            <figcaption class="figure-caption text-center">
                Using the VIA web application to swap <kbd>Fn</kbd> and Left <kbd>Ctrl</kbd> and to swap Right <kbd>Alt</kbd> and Right <kbd>Ctrl</kbd>
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/framework-fedora/framework-via-fn.png">
            <img src="/assets/images/framework-fedora/framework-via-fn.png" class="img-fluid border" alt="VIA keyboard programming web application">
            </a>
            <figcaption class="figure-caption text-center">
                Using the VIA web application to map <kbd>Fn</kbd> + <kbd>Caps Lock</kbd> to <kbd>Scroll Lock</kbd>
            </figcaption>
        </figure>
    </div>
</div>

The first set of changes I made was to swap the Left `Ctrl` key with the `Fn` key and swap the Right `Ctrl` and Right `Alt` keys to match the layout of the MacBook Pro keyboard. I could swap the `Super` and the Left `Alt` keys later, though I haven't found the need to do that yet.

Since the `Fn` and Left `Ctrl` keys are not the same size, I had to order stickers to re-label them. I then carefully swapped the keycaps on the other two keys.

I have [documented the process](https://github.com/questionlp/framework-laptop-16/blob/main/README.md#qmkvia-keyboard-left-ctrl-and-fn-swap-and-right-ctrl-and-alt-swap) of getting Framework's version of the VIA application working on Fedora and the mapping JSON files available on GitHub.

#### Compose Key

Typing special characters and characters with diacritics is a simple task on macOS by using `Option` [dead key combinations](https://support.apple.com/guide/mac-help/enter-characters-with-accent-marks-on-mac-mh27474/mac). The analog for UNIX-based operating systems would be to use the `Compose` key.

Unfortunately, I last saw a keyboard with a `Compose` key when I worked on Sun SPARC workstations. Thankfully, most modern desktop environments allow mapping a different key or key combinations to act as a `Compose` key.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/framework-fedora/key-bindings.png">
    <img src="/assets/images/framework-fedora/key-bindings.png" class="img-fluid border" alt="Key binding configuration in KDE Plasma">
    </a>
    <figcaption class="figure-caption text-center">
        Mapping <kbd>Scroll Lock</kbd> to <kbd>Compose</kbd> in KDE System Settings
    </figcaption>
</figure>

I programmed the Framework keyboard to map `Fn` + `Caps Lock` to a `Scroll Lock` key and then use the KDE "System Settings" application to map the `Scroll Lock` key to the `Compose` key. Instructions on making that change in KDE, GNOME, Cinnamon, MATE, and XFCE are available in the same document as the QMK/VIA page I linked above.

The [Compose Key Cheat Sheet](https://opensource.com/sites/default/files/2022-07/OSDC_cheatsheet-compose-2022.4.15.pdf) from OpenSource.com helped me learn the different sequences.

#### Wireless Network Module Swap

Framework laptops with an AMD Ryzen processor use the MediaTek/AMD RZ616 Wi-Fi 6E wireless module instead of an Intel one. Using a MediaTek wireless network module is not great news for Linux because driver and firmware issues can lead to poor performance or more frequent connectivity dropouts. I experienced both even when using the latest kernel version available with Fedora 40.

On a whim, I decided to swap out the MediaTek wireless module with a non-vPro version of the Intel Wi-Fi 6E AX210 wireless module that I purchased from [Framework's marketplace](https://frame.work/products/intel-wi-fi-6e-ax210-no-vpro). Removing the MediaTek wireless module was the easy part. Attaching the antenna cables and inserting the new wireless module was an utter pain in the backside, especially when I was terrified of mangling the connectors.

I ran several network speed tests using iPerf3 before and after swapping out the wireless network modules. The Intel module consistently performed around 6% faster than the MediaTek module while experiencing fewer connection drops.

I have a single Ubiquiti U6 Enterprise access point serving all my wireless devices. I used my TrueNAS Mini X+, which was connected to the network over a 10 Gigabit connection, to run iPerf3 in server mode. The server connects to a Ubiquiti Pro 48 non-PoE switch, and there is a 10 Gigabit direct-attached cable between the Pro 48 switch and the Enterprise 8 PoE switch where I link up the access point.

Neither the MediaTek nor the Intel wireless module could maintain a stable 6 GHz network connection to the access point. The 6 GHz connection drops may be due to the antennas or placement in the Framework laptop, drivers, device firmware issues, or the access point's location. Since my iPhone is the only device I can connect to on the 6 GHz band, I decided to turn off the 6 GHz radio on the access point.

### Closing Thoughts

I still use my MacBook Pro for some tasks, including syncing music, exporting photos from my phone, and accessing photos in Adobe Lightroom Classic catalogs. The first two are tasks that I do weekly, and I use Lightroom Classic a couple of times a year.

I don't plan on migrating off of an iPhone for a while, but I'll need to start looking at options for photography if and when I get back out and start taking photos.

If you had asked me if I would migrate away from macOS five years ago, I would have said no. The hurdles were that I was more of an active photographer and used many Adobe products, along with the comfort of using macOS. Now that I am no longer as bound to Adobe products and the improvements to Linux, desktop environments, and application availability and quality, the move to Linux was much more viable.

I will stay with Fedora and KDE in the near and medium term, but I will continue experimenting with other distributions and desktop environments on a spare laptop.
