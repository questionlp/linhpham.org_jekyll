---
layout: post
title:  "ThinkPad Updates: Switching to Fedora 39"
date:   2024-02-26 12:05:00 -0800
tags:   fedora hardware laptops linux
---

About a month ago, I picked up another ThinkPad T14 laptop as a sandbox for learning and experimenting with other Linux distros. The second T14 laptop is a Gen 2 with an AMD Ryzen processor that I upgraded to 48 GB of RAM and installed a 2 TB WD Black SN850X NVMe SSD to mirror the Gen 3 laptop. The first distro that I wanted to run was [Arch Linux](https://archlinux.org/). I would eventually switch to [KDE Plasma spin](https://fedoraproject.org/spins/kde/) of Fedora 39 to give [Fedora](https://fedoraproject.org/) another try after using Ubuntu and Debian for a while.

### Fedora and GNOME

On the T14 Gen 3 laptop, the continual graphical glitches started to irritate me more, along with the niggling issues that caused me to spend even more of my free time trying to troubleshoot and resolve. Meanwhile, I became more comfortable using Fedora, especially the DNF package management system. Eventually, I backed up my files on the T14 Gen 3 laptop, popped in a spare 2 TB SN850X SSD, and installed Fedora 39.

Instead of choosing the KDE Plasma spin of Fedora, I opted to go with the standard Workstation Edition that includes a vanilla GNOME experience. I only experienced a handful of graphical glitches when using the [Pop!_OS](https://pop.system76.com/) flavor of GNOME, so I hoped that would continue with Fedora.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/thinkpad/fedora-39-neofetch-dev.png">
    <img src="/assets/images/thinkpad/fedora-39-neofetch-dev.png" class="img-fluid border" alt="Visual Studio Code, terminal window with neofetch output and a web browser window">
    </a>
    <figcaption class="figure-caption text-center">
        Fedora 39 running on a Lenovo ThinkPad T14 Gen 3 with Visual Studio Code, terminal window and Firefox open
    </figcaption>
</figure>

Almost immediately, I noticed that trackpad gestures worked a lot more consistently in GNOME than with KDE. After getting over the initial bump of learning how GNOME handles window management, tasks, and workspaces, switching from KDE to GNOME was the right decision for me.

There are a couple of places where GNOME and the included GNOME applications fall behind KDE's counterparts:

* GNOME Settings is quite limited compared to KDE Settings, especially regarding user interface customization and hardware settings. I used several [GNOME Extensions](https://extensions.gnome.org/) and the [GNOME Tweaks](https://gitlab.gnome.org/GNOME/gnome-tweaks) application to tweak things to my liking.
* The GNOME Terminal application has issues rendering Powerline characters, has limited settings for theming and text handling, and does not use standard configuration files that can be checked into source control. I ended up installing and using [Alacritty](https://alacritty.org/) instead.
* The file listing and view options leave much to desire in the GNOME Files (formerly known as Nautilus) file manager application compared to KDE's Dolphin file manager.

On a positive note, quickly connecting to and browsing files over SMB and SCP/SFTP in GNOME Files felt more seamless than in Dolphin. I encountered issues when trying to have Files save my credentials more permanently. When selecting that option and connecting to SMB shares on a Synology and a TrueNAS SCALE server, the "Failed to retrieve share list from server: Invalid argument" error is returned. If I change the option to save my credentials for the current session, I can connect and mount the shares.

### Applications and Hardware-Accelerated Video

Once settled in, it was time to install the necessary applications and packages for general desktop use and Python, Node, and Ruby development. First up were several command-line tools and fonts:

```bash
sudo dnf install htop screen vim neofetch mozilla-fira-mono-fonts mozilla-fira-sans-fonts fira-code-fonts jetbrains-mono-fonts-all cascadia-fonts-all cascadia-code-fonts cascadia-code-pl-fonts ibm-plex-fonts-all git gh zsh avahi-tools
```

Since Fedora does not include any non-free multimedia codecs in the default installation, I followed the instructions to [install the OpenH264 package using the steps](https://docs.fedoraproject.org/en-US/quick-docs/openh264/) provided by the Fedora Project:

```bash
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264
```

Once the packages were installed, I opened Firefox, browsed to `about:config`, and set the following config settings to `true`:

* `media.gmp-gmpopenh264.autoupdate`
* `media.gmp-gmpopenh264.enabled`
* `media.gmp-gmpopenh264.provider.enabled`
* `media.peerconnection.video.h264_enabled`

In addition, I enabled access to the [RPM Fusion](https://rpmfusion.org/) repositories by running the following command:

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

After enabling the RPM Fusion repositories, I installed the necessary packages to enable hardware-accelerated video and the various multimedia packages from RPM Fusion:

```bash
sudo dnf install intel-media-driver libva-utils mpv
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf group upgrade multimedia
```

I restarted the laptop and verified that I could watch videos from several streaming services that used the H.264 codec and used the `intel_gpu_top` tool to see that the video playback in Firefox and MPV was being hardware accelerated.

For applications like Slack and Discord, I used the GNOME Software application to install them via Flatpak packages. I primarily use the included Firefox browser for web browsing and installed Vivaldi when testing applications with a Chromium-based browser.

### Zsh Configuration and Dotfiles

I use Zsh with the [Oh My Zsh](https://ohmyz.sh/) framework and the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme on my Linux and macOS laptops. I have published my Zsh configuration and other dotfiles in my [questionlp/dotfiles](https://github.com/questionlp/dotfiles) Git repository at GitHub.

The dotfiles repository also includes configuration files I use for Alacritty, [Kitty](https://sw.kovidgoyal.net/kitty/), Konsole, GNU Screen, and [tmux](https://github.com/tmux/tmux).

### Development Tools

Several dependent packages needed to be installed using DNF before I could start setting up and using [pyenv](https://github.com/pyenv/pyenv), [rbenv](https://github.com/rbenv/rbenv), and [nvm](https://github.com/nvm-sh/nvm).

```bash
sudo dnf groupinstall "Development Tools" 
sudo dnf install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils tk-devel libyaml-devel gcc-g++
```

After installing the dependencies, I installed the version managers by cloning their respective Git repositories into my home directory as `.pyenv`, `.rbenv`, and `.nvm`. For rbenv, I also needed to clone the [ruby-build](https://github.com/rbenv/ruby-build) repository under the `$HOME/.rbenv/plugins` directory.

To install Visual Studio Code, I added Microsoft's Yum repository using the [instructions provided](https://code.visualstudio.com/docs/setup/linux) on their site and installed the application using DNF. For JetBrains PyCharm and DataGrip applications, I downloaded and set up the JetBrains Toolbox application.

Since I needed to be able to develop and test the Wait Wait Stats applications on the laptop, I had to install MySQL Community Server from the [MySQL Yum repository](https://dev.mysql.com/downloads/repo/yum/). On the KDE spin of Fedora, I had to uninstall the MariaDB packages that are installed as the default dependencies for the Akonadi contacts library.

### Closing Thoughts

Although I could have installed and changed from using KDE to GNOME while sticking with Debian to alleviate the issues with graphical glitches, there were other issues I did not have the spare time to chase down. It was easier to back up my files, pop in a new SSD, install Fedora, and restore them.

I found myself in a good groove working with GNOME and Fedora. Having consistently working trackpad gestures to switch between workspaces and windows makes a significant difference in having a good user experience. I appreciate the slightly more stable environment while getting leading-edge versions of libraries and applications.

My ThinkPad T14 Gen 2 laptop will continue to be my sandbox for experimenting with applications, desktop environments, and other Linux distros. I am running Pop!_OS 22.04 LTS and getting a sneak peek at the new COSMIC desktop environment, which should launch with Pop!_OS 24.04 LTS later in the year.
