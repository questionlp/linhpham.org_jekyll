---
layout: post
title:  "Homelab Setup: October 2023 Updates"
date:   2023-10-28 22:10:00 -0700
tags:   homelab servers storage networking update
---

It has been a couple of months since my last homelab setup updates ([TrueNAS Mini X+]({% post_url 2023-07-30-homelab-upgrade-truenas-mini-x-plus %}) and [July 2023 Update]({% post_url 2023-07-04-homelab-setup-july-2023-update %})), and there has been a significant update to the networking stack.

I have replaced the various unmanaged switches, including the main Netgear 24-port "core" Gigabit switch, the Netgear 5-port Gigabit switch for my desk, and the HP ProCurve 8-port Gigabit switch for my gaming and A/V stack. In their place is a set of Unifi switches from Ubiquiti networks.

At the network's core is a Unifi Professional 48 non-PoE switch with 48 Gigabit Ethernet ports and 4 10 Gigabit-capable SFP+ ports. Attached to that switch is an Enterprise 8 PoE switch using a direct-attach SFP+ cable and a Lite 16 PoE switch using an aggregate of two Gigabit ports. The reason why I chose a non-PoE version of the Professional 48 PoE switch or an Enterprise 48 PoE switch is that I only need a couple of PoE ports (including one that supports 2.5 Gigabit), and the active cooling of the larger PoE switches would increase the noise level to an unacceptable level.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/homelab/homelab-shelf-october-2023.jpg">
    <img src="/assets/images/homelab/homelab-shelf-october-2023.jpg" class="img-fluid border" alt="Computer and network equipment sitting on different levels of an open metal shelf">
    </a>
    <figcaption class="figure-caption text-center">
        Network switches, storage devices and computers situated in an IKEA FJÄLLBO shelf
    </figcaption>
</figure>

Ubiquiti states that the Professional 48 switch has "silent cooling" on the product blurb and "near-silent cooling" elsewhere on the product page. The switch has active cooling that pulls in air from the port side and exhausts out the rear. Under everyday use, the switch has the same sound level as the TrueNAS Mini X+. The noise is audible, the fan speed is steady, and it is neither whiny nor shrill.

Attached to the Enterprise 8 PoE switch is a Unifi U6 Enterprise access point that supports WiFi 6E and requires a 2.5 Gigabit port to achieve full transfer speeds. The access point will eventually be mounted to the ceiling in a central location in my home. It currently resides next to my Apple AirPort Extreme access point (not optimal, but that's the only available space).

I do not have any devices that need the PoE functionality of the Lite 16 PoE, but I may use the PoE ports for a second access point or for Raspberry Pi 4 or 5 boards that do not need a lot of power. The only feature the Lite 16 PoE switch is missing is a 2.5 Gigabit port that can be used as an uplink. That is why I chose to aggregate two ports on the switch (along with two ports on the Professional 48 switch) to increase the available bandwidth.

The Professional 48 switch has another aggregate of two Gigabit ports connected to the Synology NAS. The TrueNAS Mini X+ connects to the switch at 10 Gigabit using a Unifi 10GBaseT SFP+ transceiver. Even relatively idle, the transceiver runs very warm, and I had to attach a small heatsink to the housing to help dissipate the heat generated.

I did not go with the current generation Cloud Key as a network controller because it includes an unnecessary built-in hard drive and a non-user-replaceable battery, known to turn into a spicy pillow after some use. Instead, I opted to pick up a passively cooled Dell Wyse 5070 thin client to self-host the controller. The thin client has an Intel Celeron J4105 processor, 8 GB of RAM, and a 256 GB M.2 SATA SSD that I loaded with Ubuntu Server 22.04 LTS.

Even with all the new equipment I have added, I can still have an estimated run time of 20-25 minutes on the 1500 VA APC UPS. A future upgrade would be to replace the UPS with one that can accept an additional battery pack to increase the run time to an estimated 40-50 minutes.
