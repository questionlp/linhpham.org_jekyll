---
layout: post
title:  "Homelab Setup: Storage"
date:   2023-03-07 16:45:00 -0800
tags:   homelab storage
---

In the last two posts in the series about my homelab, I covered the [server]({{ site.url }}{% post_url 2023-02-23-homelab-setup-servers %}) and [network]({{ site.url }}{% post_url 2023-02-27-homelab-setup-networking %}) portion of the homelab. This post will cover the storage side of things.

### Network Attached Storage

#### Synology DS918+

To store photos, music, videos, games and other data, I wanted to get something simple and turnkey. So, I opted for a Synology DS918+, which provides four 3.5-inch hard drive bays, two 1 Gigabit Ethernet ports and a pair of M.2 NVMe slots for SSDs on the bottom of the unit.

In addition to slotting in four Seagate 8 TB IronWolf Pro drives running as a single volume in RAID-5 using btrfs. That provides just under 21 TB of usable storage.

I also upgraded the system to the maximum of 8 GB of memory with a second memory module. Since I only needed basic networked storage, the quad-core Intel Celeron J3455 processor is more than adequate to handle around 10 clients connecting via SMB v3 or NFS v4.

I'm thinking about replacing the Synology with another NAS, possibly something from the TrueNAS Mini line. I would be looking at something around the 100 TB of usable storage mark and support ZFS.

### Direct Attached Storage

#### G-Technology G-RAID Drives

I have a pair of G-Technology, now SanDisk Professional, G-RAID Thunderbolt drives, one with a pair of 10 TB drives in RAID-1 and one with a pair of 18 TB drives in RAID-1. Both drives connect to a 2018 Mac mini and I use Carbon Copy Cloner to backup the data stored on my Synology NAS.

While I like that the devices use enterprise-grade drives, support hardware RAID-0 or RAID-1, and have metal enclosures; my experience with G-Technology hasn't been perfect. I had to RMA the first unit with 18 TB drives due to a bad fan; and, that process took many weeks to be processed as G-Technology did not have a replacement unit to send me.

The enterprise-grade drives also run a bit louder than consumer NAS-grade drives and the metal enclosure does nothing to attenuate the sound.

#### Samsung T7 USB SSDs

For each of the two Raspberry Pi 4 nodes that I have running VMware ESXi on ARM Fling, I have picked up a 500 GB Samsung T7 external SSD for boot and VM storage.

I chose the drives because they have metal enclosures and other T7 drives that I have seemed to have performed really well as primary photography storage drives. That said, it seems like performance for those drives with the Pi 4 nodes isn't as consistent as I would have hoped.

If I were to re-do the Pi 4 nodes, I would just pick up an M.2 NVMe to USB metal enclosure and plop in higher endurance drives. But, considering what I'm really using the nodes for now, I would only go down that route now if the T7 SSDs flake out.
