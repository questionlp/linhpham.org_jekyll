---
layout: post
title:  "Homelab Setup: November 2023 Update"
date:   2023-11-28 21:25:00 -0800
tags:   homelab servers virtualization update
---

Since my [last homelab update]({% post_url 2023-10-28-homelab-setup-update-october-2023 %}) for October 2023, I have made a few changes to my virtualization setup. One of those changes includes a partial migration away from [VMware Hypervisor](https://www.vmware.com/products/vsphere-hypervisor.html).

I have used a Dell OptiPlex 7060 Micro desktop as the sole Intel-based VMware Hypervisor server. I also have three Raspberry Pi 4 8 GB boards running [VMware ESXi-ARM Fling](https://customerconnect.vmware.com/downloads/get-download?downloadGroup=ESXI-ARM) that provide network services such as DNS and WireGuard. I previously had a Dell Precision 3430 slim desktop that also ran VMware ESXi Hypervisor, but I decommissioned it after setting up the three Pi 4 boards.

I had hoped the Pi 4 boards would also be enough to run the development VMs I need. Unfortunately, the Pi 4 boards do not have the processing grunt or the available memory to run more intensive applications such as Redis, MongoDB, or OpenSearch.

So, I pulled the Precision desktop out of storage and replaced the existing SSDs with a 500 GB Micron MX500 SATA SSD and a 2 TB WD Black SN850X NVMe SSD. I also removed the heatsink and fan assembly to replace the dry and hard thermal compound. At first, I tried installing the latest version of ESXi (8.0U2), and I was met with a black screen after installing the software and rebooting. Re-installing the version I had been using (7.0U3n) would work, though the list of supported guest operating systems was starting to get dated.

As I tried to figure out which version of ESXi I wanted to stick with, I saw that [Proxmox VE 8.1 was released](https://www.proxmox.com/en/about/press-releases/proxmox-virtual-environment-8-1) and decided to try it. So, I imaged a USB thumb drive with the installer ISO and got it up and running in less than 15 minutes. On the VM storage side, I created a single drive ZFS volume on the NVMe SSD and set up a small LVM-Thin volume for temporary storage on the SATA SSD.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/homelab/proxmox-web-ui.png">
    <img src="/assets/images/homelab/proxmox-web-ui.png" class="img-fluid border" alt="Proxmox VE web interface">
    </a>
    <figcaption class="figure-caption text-center">
        Proxmox VE web interface showing a cluster with two notes
    </figcaption>
</figure>

To migrate the VMs from the OptiPlex host to the newly set up Precision host, I exported each VM as an OVF image, copied the files via SCP, and imported them using the `qm importovf` command. I had to re-add a VirtIO network interface (previously set up with VMXNET3) to each, enable QEMU Guest Agent support under the VM Options, and power up the VMs.

On each migrated VM, I had to modify the Netplan configuration files to use the correct network interface names and install the `qemu-guest-agent` package. After a reboot, the QEMU guest information populated correctly.

Once all the VMs had been migrated, I refreshed the OptiPlex desktop with a new thermal paste application and ordered another set of the same SSDs I installed in the Precision desktop. I also installed Proxmox into the computer and set up the storage similarly to the other host. Before migrating some of the VMs back over, I created a new cluster on the Precision host and joined the OptiPlex host to it. At that point, I could use live migration to move the VMs.

To round things out, I created an NFS share on my [TrueNAS Mini X+]({% post_url 2023-07-30-homelab-upgrade-truenas-mini-x-plus %}) appliance to store VM backups using the included backup functionality in Proxmox (a feature that is not available in the free license version of ESXi)

While Proxmox VE is less polished than VMware ESXi, much less the paid vSphere suite of products, it serves my virtualization needs very well. To support the continued development of Proxmox VE and to get access to the Enterprise repository for updates, I purchased a Proxmox VE Community subscription for each of the hosts.

As I write this post, no official version of Proxmox VE is available for the Raspberry Pi or other ARM-based systems. Several community members have ported the Proxmox software to ARM, but the ports are not ready for 24x7 use.

For now, my Pi 4 boards will stick with the latest version of ESXi-ARM Fling available. With [Broadcom's acquisition of VMware completed](https://investors.broadcom.com/news-releases/news-release-details/broadcom-completes-acquisition-vmware) and the VMware Flings site no longer available, the future of ESXi-ARM is unknown.
