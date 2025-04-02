---
layout: post
title:  "Homelab Setup: Networking"
date:   2023-02-27 10:00:00 -0800
tags:   homelab networking
---

This is the second series of posts where I provide a view into my homelab. In the [first post]({% post_url 2023-02-23-homelab-setup-servers %}) covered the servers that I have and what I have running on them.

In this post, I'll cover the networking side of the homelab.

### Firewall

#### Netgate SG3100

Back when I used to host my e-mail and websites, including the [Wait Wait Stats Page](https://stats.wwdt.me/), at home off of my DSL connection, everything went through a Cisco PIX 501 firewall. After moving all of my public-facing stuff on to cloud-hosted systems, I eventually went back to using consumer-grade router/firewalls, including an Apple Airport Extreme.

Eventually, the Airport Extreme just couldn't quite handle things under heavier loads. So, I picked up a Netgate SG3100 firewall, since, I wanted to use pfSense and it was a turnkey solution.

### Switches

#### NetGear and ProCurve Unmanaged Switches

My wired networking needs are very basic where I just need a bunch of Gigabit Ethernet ports to connect my servers, network-attached storage (NAS), laptops and other devices.

As such, I have a 24-port Netgear unmanaged switch that acts as my main switch. That uplinks to the LAN side of the Netgate SG3100 and all of my servers and NAS plugged in. I have an 8-port ProCurve switch that I use for the A/V stack and I have a 5-port Netgear switch on my desk for my Thunderbolt dock.

All 3 of the switches have a metal chassis to help dissipate heat and tend to be more reliable, in the long run, than cheaper switches encased in plastic.

I don't have a need for Power over Ethernet or faster connectivity at the moment at the moment. For the former, I could use power injectors for 1-2 devices; but, faster connectivity is something that I probably need sooner rather than later.

### Wireless

#### Apple Airport Extreme

Even though the Apple Airport Extreme struggled under load acting as both a router and a wireless access point, it is still perfectly serviceable running in wireless access point mode. I don't have any current need for Wi-Fi 6 or 6E speeds or device capacity at this time.

If I need faster connectivity for my laptops, I'll plug it into an open switch port via a USB or Thunderbolt dock or dongle.

That said, I know it is getting a bit long in the tooth and will have to replace it in the near future. I haven't decided on what I'll replace it with yet.
