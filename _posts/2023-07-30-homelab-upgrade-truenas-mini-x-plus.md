---
layout: post
title:  "Homelab Upgrade: TrueNAS Mini X+"
date:   2023-07-30 21:30:00 -0700
tags:   homelab storage truenas
---

In my "[Homelab Setup: Storage]({{ site.url }}{% post_url 2023-03-07-homelab-setup-storage %})" blog post, I mentioned that I have a Synology DS918+ NAS (network-attached storage) server that houses my music, video, photos, and game collection. Also, I stated that I might be looking at either replacing it or augmenting my network storage with a second NAS.

After looking at the options available, including another Synology NAS, switching to QNAP, building a custom storage server, or buying a [TrueNAS Mini](https://www.truenas.com/truenas-mini/) server, I settled on a TrueNAS Mini X+ to augment my network storage. The decision was to avoid being locked into another vendor's proprietary ecosystem or the limiting hardware options on which many home or small business NAS servers are built.

Another benefit of the TrueNAS Mini servers over anything from Synology, QNAP, or similar NAS servers is that the Mini servers are built using embedded server hardware with motherboards from Supermicro and use ECC Registered memory. The servers include Supermicro's lights-out management that can be used for remote control and console.

### Hardware and Storage Overview

I ordered the TrueNAS Mini X+ server in a disk-less configuration with the base 32 GB of RAM and dual copper 10 Gigabit Ethernet interfaces. Given how much storage the server will have and that I may run a couple of small virtual machines, upgrading to 64 GB of RAM was worth the price. The TrueNAS Mini X+ (as well as the XL and R models) uses an [Intel Atom C3758](https://www.intel.com/content/www/us/en/products/sku/97926/intel-atom-processor-c3758-16m-cache-up-to-2-20-ghz/specifications.html) processor with eight cores running at 2.20 GHz.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/truenas/truenas-mini-x-plus.jpg">
    <img src="/assets/images/truenas/truenas-mini-x-plus.jpg" class="img-fluid border" alt="TrueNAS Mini X+ storage server powered on">
    </a>
    <figcaption class="figure-caption text-center">
        TruNAS Mini X+ storage server
    </figcaption>
</figure>

I do not have any network switches that support multi-Gigabit or 10 Gigabit ports to take advantage of the 10 Gigabit interfaces. That is something I will take care of at some point.

I have five 10 TB [WD Red Pro NAS](https://www.westerndigital.com/products/internal-drives/wd-red-pro-sata-hdd) hard drives for storage and two 960 GB [Micron 5400 MAX](https://www.micron.com/products/ssd/product-lines/5400) SATA SSDs. The WD Red Pro NAS hard drives include a 5-year warranty, over three years for WD Red Plus drives, and a higher terabytes-written rating. The Micron 5400 MAX drives are rated for 5.0 DWPD (drive writes per day) and include a 5-year warranty. The DWPD rating for the Micron drives is higher than the usual 3.0-4.0 DWPD rating found on consumer SATA SSDs.

I chose the Micron drives over the TrueNAS branded "Read Cache" L2ARC and "Write Cache" ZIL/SLOG drives because they were less expensive per gibibyte, and the endurance and performance were known quantities.

### Software

While waiting for the TrueNAS Mini X+ to arrive, I had another decision: stick with the pre-installed [TrueNAS CORE](https://www.truenas.com/truenas-core/) or immediately transition to [TrueNAS SCALE](https://www.truenas.com/truenas-scale/).

CORE is built on the [FreeBSD](https://www.freebsd.org) operating system and had previously been known as FreeNAS. CORE (and the commercial version called [TrueNAS Enterprise](https://www.truenas.com/truenas-enterprise/) for specific [TrueNAS servers](https://www.truenas.com/systems-overview/) sold by iXsystems) is designed for scale-up storage and uses an active/passive failover configuration to allow for highly available storage. CORE can also run plugins, jails, and host virtual machines using bhyve to run applications.

In contrast, SCALE is a recent addition to the TrueNAS family and is based on the [Debian](https://www.debian.org) Linux distribution, and is designed to target hyper-converged and scale-out deployments. Like CORE, SCALE can host virtual machines using KVM. But, unlike CORE, SCALE supports running pre-built or custom Docker containers via Kubernetes and can be used for scale-out storage via Gluster.

Even though I have been a FreeBSD fan for a long time, I chose SCALE over CORE mainly for the more mature KVM virtualization and the ability to run applications via Docker containers. I don't usually go for bleeding-edge software or hardware for my servers or storage, but I decided it was worth the risk.

### Setting Up the TrueNAS Mini X+

After unboxing the server, I installed the five hard drives (and later the two SSDs) into the removable drive sleds. Unlike drive sled designs used in newer NAS and rackmount servers, the 3.5-inch and 2.5-inch drive sleds used in the TrueNAS Mini family of servers do not use a screw-less design. Installing the drives required removing the fillers from the sleds, sliding in, and securing the drive with four screws each.

Jimmying in the sled for the bottom 2.5-inch bay was more difficult than the top 2.5-inch bay. The tolerances are loose enough to cause some interference with the two sleds. Holding up the sled on top while sliding in the bottom sled helped a little.

I did the initial setup using the Supermicro lights-out management web interface, which provides remote KVM support. I used Google Chrome instead of my preferred browser, Safari, to get the HTML5-based KVM to work. After powering up the server, I used the setup menu provided on the console to configure the `ix0` network interface I will use. It didn't take the DNS servers I wanted to use, and I had to re-enter that using the TrueNAS web interface.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/truenas/truenas-dashboard.png">
    <img src="/assets/images/truenas/truenas-dashboard.png" class="img-fluid border" alt="Dashboard for the TrueNAS SCALE web interface">
    </a>
    <figcaption class="figure-caption text-center">
        TrueNAS SCALE web dashboard
    </figcaption>
</figure>

Once the server was able to reach out to the Internet, I updated the install of TrueNAS CORE to the latest patch and then immediately used the web interface update tool to migrate to TrueNAS SCALE. The process took about 20-25 minutes to complete. When I returned, the server had booted into SCALE, and I was ready to continue setting up the server.

### Setting Up Storage Pools, Datasets, and Shares

The five hard drives are set up in a single RAID-Z2 zpool for approximately 27 TiB (tebibytes) of usable storage. This contrasts with the RAID 5 configuration I use on my Synology NAS because it only has four drive bays. I wanted the extra insurance that the double parity provides.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/truenas/truenas-storage-dashboard.png">
    <img src="/assets/images/truenas/truenas-storage-dashboard.png" class="img-fluid border" alt="Storage Dashboard Page in the TrueNAS SCALE web interface">
    </a>
    <figcaption class="figure-caption text-center">
        TrueNAS Scale Storage Dashboard page
    </figcaption>
</figure>

I have one of the Micron drives configured as an L2ARC vdev (virtual device) and the other as a LOG vdev. To extend the overall life of the SSDs, I changed the size for both the drive that will be the L2ARC vdev to 290 GiB (gibibyte) and the drive that will be the LOG vdev to 22.5 GiB. This is done by running the `disk_resize` command as root using a remote shell (this can be done through the web interface or SSH).

I had to reboot the SCALE server to detect that I changed the drive sizes. After the server rebooted, I assigned the drives to the zpool using the web interface.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/truenas/truenas-datasets.png">
    <img src="/assets/images/truenas/truenas-datasets.png" class="img-fluid border" alt="Storage Datasets Page in the TrueNAS SCALE web interface">
    </a>
    <figcaption class="figure-caption text-center">
        TrueNAS Scale Datasets page
    </figcaption>
</figure>

Once the zpool was completed, I created a `main` dataset that will hold other datasets that will be created for each share. The `main` dataset also defines the compression, deduplication, and sync settings the child datasets will use. Most datasets I created use `zstd` for compression instead of the default `lz4` to reduce overall CPU usage required to decompress data when data is read, at the expense of additional CPU usage when writing data.

I enabled case sensitivity for the datasets since I have a mix of macOS, Linux, and Windows clients. I also set the share type for the datasets to `Generic` rather than `SMB` even though the datasets will be shared as both SMB and NFS shares. This can resolve an issue where browsing directories in SMB shares in Windows takes much longer than expected.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/truenas/truenas-sharing.png">
    <img src="/assets/images/truenas/truenas-sharing.png" class="img-fluid border" alt="Sharing Page in the TrueNAS SCALE web interface">
    </a>
    <figcaption class="figure-caption text-center">
        TrueNAS SCALE Sharing page
    </figcaption>
</figure>

One configuration setting I would highly recommend you look into is changing the "ACL Type" set for the datasets that be used for SMB shares from `POSIX` to `SMB/NFSv4`. The setting is hidden under the dataset's "Advanced Options". This can resolve an issue where browsing directories in SMB shares in Windows takes much longer than expected.

### Transferring Data to the TrueNAS Server

To transfer files stored in the existing shares on the Synology NAS over to the new corresponding shares on the TrueNAS server, I used [Carbon Copy Cloner](https://bombich.com) on my 2018 Core i3 Apple Mac mini. It is the same application I use to backup data from the Synology NAS to the external hard drives.

I did the initial sync without the L2ARC vdev or LOG vdev set up, knowing that both drives would have been battered during the initial transfer.

I was able to saturate the 1 Gigabit link when transferring larger files but expectedly dropped when it needed to copy thousands of small files.

After copying the files to the new server and running the job a few more times to synchronize any lingering changes on the Synology NAS, I switched all my systems to use the new shares on the TrueNAS. There were a couple of minor hiccups with Plex Media Server (of course), but nothing breaking or anything that led to data loss.

I removed the migrated shares from the Synology NAS to decrease overall usage from 77% to 56%.

### Is It Worth It?

Would I recommend people to go with a TrueNAS Mini X+ over five or six-bay Synology or QNAP NAS? As usual, the answer is: it depends.

The TrueNAS Mini X+ starts at $1,448 (USD) as of writing this post, and the upgrades from iXsystems are not inexpensive. But you get server-grade hardware, ECC Registered memory, out-of-band management, TrueNAS CORE or SCALE, and ZFS out of the box.

Synology or QNAP NAS servers do not support ZFS on home or small business-oriented models. The QNAP servers that run QuTS hero cost more than those that use the base QuTS operating system. Due to the limiting form factor, you are also tied to the limited hardware upgrade options for either. That said, if ZFS is not something you need, Btrfs or another file system on top of software RAID can still serve many needs.

You can choose to build a server to run TrueNAS CORE or SCALE using whatever chassis, processor, motherboard, memory, and storage controller you want. That option may cost less than a turnkey solution. Still, you must do the extra legwork to work out compatibility between all components and, if required, out-of-band server management if it is not built onto the motherboard.

### Closing Thoughts

After using the TrueNAS Mini X+ for almost a week, I have been happy with the performance of the configuration and the web interface for managing the server.

The server is larger than my Synology NAS, draws more power, and is noisier than the Synology running in quiet fan mode. Given what the server can do, I am willing to take that trade-off.

If I had a larger budget, I may have gone with a TrueNAS XL and have a zpool for videos and another zpool for everything else. The extra cost of the XL, purchasing larger hard drives, and upgrading to 64 GB of RAM was well outside my means.

I wonder what the next generation of TrueNAS Mini servers might bring in the coming years.

### Postscript

My TrueNAS server, "harmony," is named after the Eye of Harmony from Doctor Who.
