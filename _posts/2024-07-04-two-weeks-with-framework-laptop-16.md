---
layout: post
title:  "Two Weeks with a Framework Laptop 16"
date:   2024-07-04 19:30:00 -0700
tags:   hardware laptops linux
---

As I write this, I have been using a Framework Laptop 16 as my daily driver laptop running Fedora instead of my usual [16-inch M1 Max MacBook Pro](https://support.apple.com/en-us/111901) running macOS. This post will go over the process of deciding on the Framework laptop and my experiences using it over the past two weeks.

**Note:** I will publish a follow-up post covering the software side of migrating from macOS to Fedora in the next week or so.

### The Why

I have been using [Fedora on a ThinkPad T14]({{ site.url }}{% post_url 2024-02-26-thinkpad-updates-switching-fedora-39 %}) for several months to test how well I could use Linux daily and what changes I would need to make to migrate away from macOS and my 16-inch M1 Max MacBook Pro. Outside of some software gaps in my workflow, the ThinkPad had a couple of hardware dealbreakers.

The small display and 1920x1200 resolution felt too cramped for everyday use, though it works well enough for traveling. The Intel Core i5-1245U processor was fast enough for web browsing and bursty loads, but constrained power limits and thermals capped the performance of long-running workloads.

### The Search for a Laptop

When searching for affordable performance-oriented laptops that supported running Linux, the two candidates were a [Lenovo ThinkPad P1 Gen 6](https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadp/thinkpad-p1-gen-6-(16-inch-intel)-mobile-workstation/len101t0072) and a [Framework Laptop 16](https://frame.work/products/laptop16-diy-amd-7040).

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/thinkpad/lenovo-p1-g6-laptop-bh.jpg">
            <img src="/assets/images/thinkpad/lenovo-p1-g6-laptop-bh.jpg" class="img-fluid border" alt="Lenovo ThinkPad P1 Gen 6 laptop">
            </a>
            <figcaption class="figure-caption text-center">
                Lenovo ThinkPad P1 Gen 6 laptop
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/framework-laptop/framework-laptop-16-fw.jpg">
            <img src="/assets/images/framework-laptop/framework-laptop-16-fw.jpg" class="img-fluid border" alt="Framework Laptop 16">
            </a>
            <figcaption class="figure-caption text-center">
                Framework Laptop 16
            </figcaption>
        </figure>
    </div>
</div>

ThinkPad P series laptops generally have a good track record supporting Linux, are generally easy to repair, have options for dedicated GPUs, have an option for a 4K OLED display and provide both memory and storage expansion options, including a pair of 2280 M.2 slots.

Framework focuses on creating highly modular and repairable laptops. One plus for the Framework laptop is the option to install a dedicated GPU in the future instead of being locked into a non-upgradeable GPU. Unlike the ThinkPad, the Framework has one 2280 M.2 slot and a 2230 M.2 slot.

Another plus for the Framework laptop is official support for Fedora Linux, and they contribute patches upstream.

### Choosing the Framework Laptop 16

When I compared the cost of a refurbished ThinkPad P1 Gen 6 with 64 GB of RAM, a single 2 TB NVMe drive, and an NVIDIA RTX 4090 on eBay against a Framework Laptop 16 DIY Edition with 64 GB of RAM, a [4 TB WD Black SN850X](https://www.westerndigital.com/en-il/products/internal-drives/wd-black-sn850x-nvme-ssd?sku=WDS400T2X0E) NVMe drive, a [1 TB WD SN770M](https://www.westerndigital.com/products/internal-drives/wd-black-sn770m-nvme-ssd?sku=WDBDNH0010BBK-WRSN) NVMe drive, and a bevy of expansion cards, the Framework laptop beat out the ThinkPad by over $300 ($2650 versus $2268 at the time of writing and without shipping or taxes).

Between the lower cost, repairability, and future upgradeability, I placed an order for a Framework laptop. I opted to get both lavender spacers and screen bezel, an international English (Linux) keyboard, and a multitude of expansion cards, including USB Type-C, USB Type-A, Display Port, HDMI, 2.5 Gigabit Ethernet, and an audio expansion card.

I ordered the memory kit and the two NVMe drives from Amazon to save some money.

### Putting it All Together

The laptop and all of the parts arrived within several business days. I opened the box for the Framework laptop and was impressed at how well-packed and organized everything was. Most of the packaging used was paper, cardboard, or other fiber-based materials. A rigid piece of plastic separated the components from the laptop to protect the lid and screen.

To install the memory modules and the two NVMe drives, I had to loosen around 15 captive screws to remove the midplate. Framework included a pre-installed thermal pad on the mainboard to help cool the 2230 M.2 drive, located directly under the 2280 M.2 drive. Removing and installing the midplate is a fiddly and a little nerve-wracking, between the number of screws and the fear of deforming the midplate when trying to remove it.

Sliding in the keyboard, spacers, and trackpad module is easy, though I had to apply some downward pressure on the edge of the trackpad module facing me while sliding it in. If not, the slight flex of the module will click a little when pressing down on it.

<div class="row">
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/framework-laptop/framework-laptop-16-open.jpg">
            <img src="/assets/images/framework-laptop/framework-laptop-16-open.jpg" class="img-fluid border" alt="Framework Laptop 16 with lavender screen bezel and spacers">
            </a>
            <figcaption class="figure-caption text-center">
                Framework Laptop 16, with a lavender screen bezel and keyboard spacers, running the KDE Plasma spin of Fedora
            </figcaption>
        </figure>
    </div>
    <div class="col col-lg-6">
        <figure class="figure">
            <a target="_blank" href="/assets/images/framework-laptop/framework-laptop-16-lid.jpg">
            <img src="/assets/images/framework-laptop/framework-laptop-16-lid.jpg" class="img-fluid border" alt="Framework Laptop 16 lid with various stickers">
            </a>
            <figcaption class="figure-caption text-center">
                Various stickers adorning the lid of a Framework Laptop 16
            </figcaption>
        </figure>
    </div>
</div>

The tolerances and fitment of the spacers could be better, as there are noticeable gaps between pieces, some flex even when secured, and the trackpad module and spacers have an edge facing the keyboard that doesn't feel great when my palms rub against them.

Several reviewers who received early batches of the Laptop 16 noted that the keyboard had more flex than they would prefer, causing a degraded typing experience. There may have been some revisions to the keyboard module or the mid-plate to reduce some of the flex, as I have yet to experience the same amount of keyboard flexing while typing. It may not be as firm as the keyboard on my MacBook Pro, but it is much better than other PC laptops I have used recently.

### Expansion Cards: The Good and The Bad

As mentioned earlier, I ordered a whole set of expansion cards for the laptop so that I can use a mix of USB Type-A and Type-C ports, use wired Ethernet connectivity when I need to transfer a lot of data or need a connection with lower latency, have options for display output, and have a headphone/headset jack.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/framework-laptop/expansion-card-slots.png">
    <img src="/assets/images/framework-laptop/expansion-card-slots.png" class="img-fluid border" alt="Diagram of the Framework Laptop 16 expansion card slots">
    </a>
    <figcaption class="figure-caption text-center">
        Diagram of the Framework Laptop 16 expansion card slots showing what each slot of capable of
    </figcaption>
</figure>

Outside of the initial file transfers over wired Ethernet, I have four USB Type-C expansion cards installed in slots 1, 2, 4, and 5, a USB Type-A card in slot 3, and a headphone/headset output card in slot 6. Framework has [more information](https://knowledgebase.frame.work/en_us/expansion-card-slot-functionality-on-framework-laptop-16-rkUjGm7cn) regarding optimal card slot configuration.

You read that correctly. The Laptop 16 doesn't include a built-in headphone/headset jack, which is a downgrade compared to the Laptop 13. I understand that Framework wanted a higher-quality audio solution for the Laptop 16 and opted for an audio expansion card. I prefer using a wired headphone or headset with my laptop; losing one expansion card is disappointing.

### Comparing the Framework Laptop with the MacBook Pro

#### The Display

The display on the Framework Laptop 16 is a downgrade in some aspects compared to that on my 16-inch MacBook Pro. The MacBook Pro's display has a native resolution of 3456x2234, while the Laptop 16 has a native resolution of 2560x1600.

On the MacBook Pro, I have the display scaling and rendering set to 2066x1329, which balances legibility and available working area. While that is a lower effective resolution than 2560x1600, display and font scaling in Linux is still well behind that of macOS, and it can feel like there is too much and too little working space.

I prefer the matte finish on the Laptop 16's display over the glossy finish on the MacBook Pro's display.

#### The Trackpad

Something I noticed with the trackpad was that it started to feel a little loose when lightly tapping on the bottom half. While it wouldn't trigger a click, it was more movement than expected. A quick fix was to remove the trackpad module, flip it upside down, and press evenly on the metal piece where the trackpad moves down to register a click. That was enough to eliminate the extra play.

I am still getting used to the smaller trackpad, the pivoting mechanism for clicking it (compared to the haptic feedback from the MacBook Pro's Force Touch trackpad), and the slightly worse palm rejection. Resolving the palm rejection issues may involve a combination of trackpad firmware, software drivers, and configuration settings available in the desktop environment.

#### Ports and Expansion Cards

Although I wrote about the expansion cards I have purchased and currently use, I am still waiting for Framework to make an SD card reader available for sale. I also miss having MagSafe charging to prevent damage to the charging cable or USB Type-C port in case the cable gets caught or tripped over. While adapters can provide MagSafe-like charging, I am uncertain how long they would last and if any would support sustained charging at over 100 watts.

The Framework laptop supports USB4 in card slots 1 and 4, which should include support for PCIe tunneling. For grins and giggles, I tried using an [OWC Thunderbolt 3 dock](https://eshop.macsales.com/shop/docks/owc-thunderbolt-3-dock) with several of my MacBook Pro laptops. Fedora saw the ports and controllers in the dock but would not accept a charge. I am looking for a USB4 dock with 2.5 Gigabit Ethernet, USB-PD passthrough, and a full-sized SD card reader.

Regarding charging the laptop, the USB Type-C charging cable I received with my laptop would not charge the laptop with the provided power adapter or any other power adapter. The cable would also not charge any other laptop or device I had. I could charge the laptop with the power adapter and other USB-PD cables. I opened a support ticket with Framework and got an RMA started for a replacement cable. I ordered a second charging cable from Framework to have a spare, and that cable works as intended.

#### Thermals and Cooling

Power efficiency was one of the significant improvements Apple made when it switched from Intel processors to ARM-based Apple Silicon processors in its Macs. I used to daily drive a [2019 16-inch MacBook Pro](https://support.apple.com/en-us/111932) with a Core i9 processor that ran warm under low loads, hot under moderate loads, and screaming hot either under heavy loads or moderate loads on warm days. The fan would be on most of the time and running at full speed, even under moderate loads.

In contrast, the M1 Max MacBook Pro rarely got warm, and the fans were near-silent, except when running both the processor and GPU at full tilt.

The Framework laptop, with the base AMD Ryzen 7840HS processor and no dedicated GPU, almost always runs warm, even with light loads. When compiling applications or watching videos, even with hardware decoding in use, the laptop gets very warm. I'll attribute this to the relatively higher power consumption of the Ryzen processor, even at near idle, fan curves, and the power profiles daemon that Framework recommends using with Fedora.

I knew this going in, knowing that current Intel and AMD mobile processors still cannot compete with Apple Silicon regarding power efficiency and performance-per-watt.

### Closing Thoughts

While there are some downgrades and side-grades compared to my MacBook Pro, the Framework laptop has been solid and is infinitely more upgradeable and repairable than the Apple laptop. Running Fedora and having complete hardware support, including the fingerprint reader, out of the box is a huge plus. And, yes, I know about the [Fedora Asahi Remix](https://asahilinux.org/fedora/) and plan on installing it on the MacBook Pro soon.

<figure class="figure w-100">
    <a target="_blank" href="/assets/images/framework-laptop/framework-laptop-16-fedora.png">
    <img src="/assets/images/framework-laptop/framework-laptop-16-fedora.png" class="img-fluid border" alt="KDE Plasma System Settings displaying system information">
    </a>
    <figcaption class="figure-caption text-center">
        Hardware and software information shown in the KDE Plasma System Settings application
    </figcaption>
</figure>

Although I didn't cover using Fedora Linux on the laptop or some software and hardware modifications I've made, I will cover those in a follow-up post as those reflect more on the operating system than the hardware.

So far, I am happy with the Framework laptop and have chosen it as my daily driver laptop. I look forward to the upgrades and new expansion modules and cards Framework will bring out over the years.
