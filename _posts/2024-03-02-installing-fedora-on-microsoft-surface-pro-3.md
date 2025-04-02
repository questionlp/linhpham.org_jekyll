---
layout: post
title:  "Installing Fedora on a Microsoft Surface Pro 3"
date:   2024-03-02 20:40:00 -0800
tags:   fedora hardware laptops linux
---

**Update:** The issue seems to have been resolved with the ISO images for the first beta varsion of Fedora 40. I was able to boot from the ISO image for the regular Fedora Workstation and for the KDE spin without modification. I did not have to disable either the TPM or the Secure Boot UEFI settings.

In November, in the [blog post]({% post_url 2023-11-27-laptop-lenovo-thinkpad-t14-gen-3 %}) about the Lenovo ThinkPad T14 Gen 3 laptop I had purchased, I installed Kubuntu on a Microsoft Surface Pro 3 tablet. Since then, I wanted to try Fedora but ran into a blocker when trying to boot from a USB thumb drive containing any spin of Fedora 39. The following error would appear after the Surface started to boot:

```text
Invalid image
Failed to read header: Unsupported
Failed to load image: Unsupported
start_image() returned Unsupported
```

The error message would appear if the Surface had Secure Boot enabled, which is the default setting, but would work if Secure Boot was disabled.<!--more--> I found a [post on the Fedora Discussion](https://discussion.fedoraproject.org/t/bug-cant-boot-on-microsoft-surface-devices/93612) site where someone had the same issue with their Surface. Due to time constraints, I opted to install Debian 12 with KDE Plasma to see how well Debian would run on the Surface.

### Preparing and Modifying Fedora Installer Files

Fast forward to this past week, I had some spare time to see if I could get the KDE spin of Fedora 39 running on the Surface. The first thing I did was to write a copy of the Live ISO image onto a USB thumb drive using the following command on my ThinkPad T14 Gen 3 (running Fedora 39):

```bash
sudo dd bs=4M if=Fedora-KDE-Live-x86_64-39-1.5.iso of=/dev/sda status=progress oflag=sync
```

I returned to the [Fedora Discussion](https://discussion.fedoraproject.org/) post I had bookmarked earlier and followed the [link to a workaround](https://discussion.fedoraproject.org/t/install-media-dont-boot-in-uefi-mode-on-certain-motherboards/71376). The workaround was to replace the `BOOTX64.EFI` file in the thumb drive's EFI system partition (ESP). To do so, I ran `fdisk -l /dev/sda` to find the partition number to mount the filesystem. I ran the following command to mount the partition to `/mnt`.

```bash
sudo mount /dev/sda2 /mnt
```

In the instructions for the workaround, there was a link to an [older version](https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/36/Everything/x86_64/os/Packages/s/shim-x64-15.4-5.x86_64.rpm) of the UEFI bootloader RPM package. I downloaded the file and extracted its contents using the following command:

```bash
rpm2cpio shim-x64-15.4-5.x86_64.rpm | cpio -idmv 
```

Once the files were extracted, I followed the instructions to remove three files under the `EFI/BOOT` directory of the mounted partition and copied them into the `BOOTX64.EFI` file contained in the extracted RPM.

```bash
cd /mnt/EFI/BOOT
sudo rm BOOTX64.EFI BOOTIA32.EFI grubia32.efi
sudo cp {Path to extracted shim-x64-15.4-5.x86_64.rpm}/boot/efi/EFI/BOOT/BOOTX64.EFI BOOTX64.EFI
```

After following those steps, I unmounted the filesystem and the thumb drive and tried to boot the Surface using the thumb drive with Secure Boot enabled. The Surface could finally boot from the thumb drive, and I was greeted with the boot loader menu. For some reason, the display settings for the KDE live boot had screen scaling set to 175%, causing the Fedora installer to have hilariously large text. I changed the screen scaling down to 120% and restarted the installer.

### Post-Installation Tasks

After installing Fedora and rebooting the Surface, a repeating series of error messages appeared on the screen:

```text
../../grub-core/commands/efi/tpm.c:48:Unknown TPM error.
../../grub-core/commands/efi/tpm.c:48:Unknown TPM error.
../../grub-core/commands/efi/tpm.c:48:Unknown TPM error.
```

I restarted the Surface, entered the firmware settings, disabled TPM, and got Fedora booted up. While I could continue to use the Surface with TPM disabled, I wanted to have Fedora working using the default firmware settings.

While searching for the error message online, I found a [different thread](https://discussion.fedoraproject.org/t/gnome-software-update-boot-error-grub-core-commands-efi-tmp-c-unknown-tpm-error/75009) on Fedora Discussion where someone had encountered the same error message on a different system. One suggestion was resetting the Secure Boot keys on the computer. I restarted the Surface again, entered the firmware settings, enabled TPM, reset the Secure Boot keys to allow Microsoft and third-party keys, and restarted the Surface.

Upon restarting the Surface, I was presented with a red screen with the Surface logo, then the same repeating series of error messages. I restarted the Surface again, went back into the firmware settings to verify that both TPM and Secure Boot were enabled, and then restarted the Surface again. Finally, the Surface could boot into Fedora, and everything was running fine.

### Using the Surface as a Tablet with Fedora and KDE Plasma

Something I should have tried while Kubuntu or Debian was installed on the Surface was how well KDE Plasma works when switching between laptop and tablet modes and changing from landscape to portrait mode. With Fedora installed, I pulled off the Type Cover and noticed some window decorations (including the minimize, maximize, and close buttons) for windows that use KDE Plasma theming. But other applications, including Firefox, did not.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/surface/surface-pro-3-fedora-kde-spin.png">
    <img src="/assets/images/surface/surface-pro-3-fedora-kde-spin.png" class="img-fluid border" alt="neofetch system information output in a terminal window">
    </a>
    <figcaption class="figure-caption text-center">
        neofetch output from a Microsoft Surface Pro 3 running KDE Plasma spin of Fedora 39
    </figcaption>
</figure>

Out of the box, KDE did not have a virtual on-screen keyboard enabled but did have the Maliit keyboard available for use in System Settings. Even with the Type Cover attached, the virtual keyboard would appear when I switched to a window anticipating keyboard input, such as Konsole, using the touchscreen, but not when using a trackpad.

Rotating the Surface into portrait orientation was relatively smooth (I would attribute any stuttering or screen tearing to the slow integrated graphics). In either landscape or portrait mode, the Maliit virtual keyboard took up a lot of screen real estate. Even with the size of the virtual keyboard, it is missing some critical function keys and modifiers, such as `CTRL`, `ALT`, or `ESC`.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/surface/surface-pro-3-fedora-tablet-mode.png">
    <img src="/assets/images/surface/surface-pro-3-fedora-tablet-mode.png" class="img-fluid border" alt="KDE Plasma with screen in portrait orientation and on-screen keyboard">
    </a>
    <figcaption class="figure-caption text-center">
        Microsoft Surface Pro 3 in portrait orientation with KDE Plasma on-screen keyboard open
    </figcaption>
</figure>

Other hiccups I ran into when using the Surface in tablet mode include the inconsistency of being able to move and resize windows and selecting, copying, and pasting text. Sometimes, moving or resizing windows causes the virtual keyboard to flicker on and off screen, or the touch targets are too small. A third of the time, I could get the text selection handles to appear when selecting text, but I could not bring up a context menu or touch pop-up to copy, paste, or cut the text.

### Conclusion

To use the Surface purely in tablet mode, I need to find a better virtual keyboard with the necessary function keys, cursor keys, and modifiers. I also need to figure out how to consistently select, copy, and paste text using only the touchscreen. I will use the Surface in laptop mode most of the time and use tablet mode only when I need to.

The Surface will only see little use as I use my ThinkPad T14 Gen 3 as my Linux daily driver laptop alongside my M1 Max MacBook Pro for macOS applications. My ThinkPad T14 Gen 2 laptop will be used as a secondary laptop for testing applications on Pop!_OS and following the development of the new COSMIC desktop environment.
