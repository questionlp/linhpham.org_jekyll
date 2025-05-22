---
layout: post
title:  "Homelab Setup: July 2023 Update"
date:   2023-07-04 19:45:00 -0700
tags:   homelab servers storage networking virtualization update
---

Since publishing the "[Homelab Setup: Servers]({{ site.url }}{% post_url 2023-02-23-homelab-setup-servers %})" post back in February, I have made several changes and updates to my homelab; including, some consolidation of workloads and an update on the storage side of things.

**Update:** There has been a little shuffling around with the Raspberry Pi 4 boards that are currently in use since this post was written. The "[Raspberry Pi Updates]({{ site.url }}{% post_url 2023-07-04-homelab-setup-july-2023-update %}#raspberry-pi-updates)" section has been updated to reflect the latest changes.

### Raspberry Pi Updates

The first change has been the addition of a third Raspberry Pi 4 board running VMware ESXi on ARM Fling and a fourth one that will be joining the collection soon. Like the first two boards, the third board has 8 GB of RAM, and that is definitely more than sufficient for running a backup internal DNS server (previously running as an ESXi virtual machine on the Dell Precision 3430 SFF). The fourth board has 4 GB of RAM and I'm not entirely sure what I will be using that one just yet.

For the newer Pi 4 boards, I have switched away from CanaKit's Flirc-style fanless, aluminum cases to fan-less, aluminum heatsink cases that sandwich the Pi 4 board. While the CanaKit cases are nice looking, but they don't seem to be able to shed as much heat as I would like; especially, with the weather getting warmer. I didn't want to get a case with the fan that not only adds a point of failure, but those tiny fans are bound to be noisy (eventually).

### Samsung T7 USB SSDs Update

In the "[Homelab Setup: Storage]({{ site.url }}{% post_url 2023-03-07-homelab-setup-storage %})" post, I had commented that I was getting some inconsistent performance out of the drives. Between updating the version of ESXi on ARM Fling and moving the SSDs further away from the Pi 4 cases, they seem to perform more consistently.

If you plan on using a bunch of them in a Pi 4 cluster, I would recommend finding a way to keep them on the cooler side. The included USB Type A to USB Type C cable is just long enough to put them over to the side, away from the Pi 4 boards; but, you may need to get longer USB 3.0 Type A to Type C cables depending in how you have your cluster set up.

### WireGuard and VPN Tunnels

Running on one of the first two boards is a virtual machine that is running PiVPN so that I can connect back to my home network remotely using WireGuard. While, it is something that I thought about running on my NetGate SG3100 appliance, I decided to use that eventually handle site-to-site tunnels.

I am still toying with the idea of using Tailscale to create a VPN mesh between my home and other cloud locations; but, I don't like the idea of having to be dependent on a third-party for everything.

### Consolidating Plex Media Server Instances

Up until the day that I'm writing this post, I have had two instances of Plex Media Server running at home. The primary instance is where the majority of my videos and music collection are cataloged and streamed from. The secondary instance is running on a Dell OptiPlex 7060 Micro serving as a DVR for recording programming available over-the-air by way of an HDHomeRun Flex Duo.

I'll touch on the reasoning for the consolidation of Plex Media Server instances in the next section.

Below is an overview of the process, which is based on the [Move an Install to Another System](https://support.plex.tv/articles/201370363-move-an-install-to-another-system/) support document. Note, that I am not just moving libraries from one instance to another. I am also including a clean re-install of Plex Media Server on an existing instance.

1. Disable, if enabled, the "Empty trash automatically after every scan" setting under `Settings > Library`
2. Update the NFS exports on my NAS to allow the OptiPlex 7060 Micro to mount the appropriate volumes
3. Install `nfs-common`, add the required entries to `/etc/fstab` and mount the shares
4. Log on "locally" to the instance on the OptiPlex 7060 Micro (using an SSH tunnel) and disconnect it from my Plex account
5. Stop the Plex Media Server service
6. Rename `/var/lib/plexmediaserver` to `/var/lib/plexmediaserver.old`
7. Uninstall and purge Plex Media Server via `apt-get remove` and `apt-get purge`
8. Log on "locally" to the instance running as a virtual machine (using an SSH tunnel) and disconnect it from my Plex account
9. Stop and disable the Plex Media Server service
10. Package up `/var/lib/plexmediaserver/Library/Application Support/Plex Media Server` and transfer it to the destination
11. Re-install Plex Media Server and stop the service
12. Copy the extracted `Plex Media Server` files into `/var/lib/plexmediaserver/Library/Application Support/`
13. Start the Plex Media Server service
14. Log on "locally" to the instance on the OptiPlex 7060 Micro (using an SSH tunnel) and re-connect it to my Plex account
15. Verify that the libraries are available and the media files are available and playable
16. Set the DVR function back up
17. Re-enable the "Empty trash automatically after every scan" setting under `Settings > Library`

I used the same mount points for the NFS shares as on the primary instance, so I didn't have to update the libraries to include the new mount points. If the paths are different between the source and the destination instances, you will want to add the new paths to the corresponding libraries before re-scanning the library after step 14. Once the files have been picked up, you can remove the old paths in the corresponding libraries and running another re-scan to clean things up before running step 17.

That whole process took about 2 hours to complete, start to finish. How long it will take for you will depend on the size of the `Plex Media Server` directory, the number of libraries that you have, and if you need to migrate to new paths for each of your libraries. If I hadn't kept the NFS mount points the same, it would have probably added another 30 minutes to take the additional steps.

### Consolidating VMware ESXi Servers

I decided to combine the two instances together and have it run on the Dell OptiPlex 7060 Micro that had been running my secondary instance serving as a DVR. The first reason why I moved the libraries from an instance running in a VM to an instance running on a physical machine is to make use of Intel Quick Sync Video to help offload some media transcoding. Hopefully this will reduce the extremely CPU taxing transcoding that was causing a lot of hitches in playing videos on my 2nd generation Apple TV 4K or on my iPhone. That said, I haven't had a chance to test to see how well Intel Quick Sync Video works on the media files that I have.

The second reason is that I wanted to deprecate the Dell Precision 3430 SFF as a "production" level server and reduce the overall footprint of the compute stack. With the addition of the third Pi 4 board running ESXi on ARM Fling and migrating web apps over to run on the Pi 4 boards, I could use the extra headroom that I had on the OptiPlex 7090 Micro to move a utility virtual machine over.

Right now, I have exported several key virtual machines, as OVF, and copied them over to my NAS for safe keeping. I have also powered off the Precision 3040 SFF and will let things settle over the next week or so.

I don't have any immediate plans for the, now, deprecated machine. It has an Intel Core i5-8600 processor, so it's still usable for other purposes.
