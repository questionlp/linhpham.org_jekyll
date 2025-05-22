---
layout: post
title:  "Homelab Setup: Servers"
date:   2023-02-23 14:00:00 -0800
tags:   homelab servers virtualization
---

As I mentioned in my last post, "[upsview: Flask UPS Monitoring Web Application]({{ site.url }}{% post_url 2023-02-17-upsview-flask-ups-monitoring %})," I have a small homelab set up at home that includes a few systems that act as servers, storage, and networking devices.

I am starting a series of posts that will provide a bit of a view into my homelab and explain why I opted to go down a certain route. In this post, I'll cover the computers that I have that act as my servers.

### Virtualization

#### Dell Precision 3430 SFF and OptiPlex 7070 Micro

For my server needs, I don't need that much compute power and I have a requirement to keep power consumption, heat output, noise levels and overall footprint down as much as I can.

As such, I have opted for smaller form factor machines that I've picked up refurbished or open box from the Dell Outlet, including a Precision 3430 small form factor "workstation" and an OptiPlex 7070 Micro desktop.

The Precision 3430 has a 6-core [Intel Core i5-8600](https://ark.intel.com/content/www/us/en/ark/products/129937/intel-core-i58600-processor-9m-cache-up-to-4-30-ghz.html) processor while the OptiPlex 7070 has an 8-core [Intel Core i7-9700](https://ark.intel.com/content/www/us/en/ark/products/191792/intel-core-i79700-processor-12m-cache-up-to-4-70-ghz.html) processor.

Both provide me with ample compute power to run virtual machines, using VMware vSphere Hypervisor (ESXi 7.0), that run Plex media server, dev-test machines, utility servers and internal DNS.

VMs live on an M.2 NVMe SSD installed in each system and each boot off of a 2.5" SATA SSD, which also houses ISO images and ephemeral virtual machines for lightweight uses.

#### Raspberry Pi 4 8 GB (x2)

I was lucky enough to pick up a pair of Raspberry Pi 4 8 GB boards before the prices really sky-rocketed during the pandemic and the ongoing parts shortage. I had originally intended to run a small microk8s cluster with both systems. Instead, picked up an external USB SSD for each and installed VMware ESXi on ARM Fling. I'm using a CanaKit 5 V/3.5 A power adapter to make sure the Pi and the SSD have enough power during heavier loads

Running on each Pi are my primary and secondary internal DNS servers and other very lightweight workloads. This allows me to power down almost everything else in event of a power outage and I still need to keep my Internet connection up since I work from home full time.

### DVR

#### Dell OptiPlex 7060 Micro

After dropping cable TV and needing a means of recording shows and sports broadcasted over-the-air, I picked up a used OptiPlex 7060 Micro with a 6-core [Intel Core i5-8500T](https://ark.intel.com/content/www/us/en/ark/products/129941/intel-core-i58500t-processor-9m-cache-up-to-3-50-ghz.html) processor, popped in an NVMe SSD as a boot device and a 2 TB 2.5-inch SATA SSD to store shows that I wanted to record.

To record OTA broadcasts, I installed Plex media server and connected a HDHomeRun Flex Duo to my TV antenna and to my network.

It's no Tivo in terms of software features nor does it have robust TV programming data, but I can choose the hardware and setup that I wanted; plus, I have it recording the ATSC stream directly so that I can transcode it into whatever format I choose.

### Other Servers

#### Raspberry Pi 2 Model B

I picked up the Pi 2 board a very long time ago, slapped it into an inexpensive case and never used it until last year. That's when I needed something to monitor my UPS battery backup units (as described in the aforementioned previous post). So, I dug it out and used it for that purpose.

#### Mac mini (2018)

I needed a means to back up data off of my Synology NAS unit, but didn't want to use the software available for their NAS operating system. I also needed a machine to run a Windows 10 virtual machine from time to time so that I can run some Windows-specific programs.

So, I picked up a Mac mini with an Intel Core i3 processor and plugged in several external hard drives to serve as backup storage and installed VMware Fusion.
