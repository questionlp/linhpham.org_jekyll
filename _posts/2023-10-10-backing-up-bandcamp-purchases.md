---
layout: post
title:  "Backing Up Bandcamp Purchases"
date:   2023-10-10 09:05:00 -0700
tags:   bandcamp tutorial
---

On September 28, 2023, Epic Games announced that they would be selling [Bandcamp](https://bandcamp.com/) to SongTradr ([press release](https://www.songtradr.com/blog/posts/songtradr-bandcamp-acquisition)). This change introduces concerns with the long-term prospects of Bandcamp and how SongTradr will handle the organization of a union by Bandcamp employees.

With the uncertainty of the long-term fate of Bandcamp, it is an excellent time to consider backing up your Bandcamp purchases and keeping them safe. [Andrew Slice](https://github.com/easlice) published a Python script called [bandcamp-downloader](https://github.com/easlice/bandcamp-downloader) that can download your purchases in bulk. In this post, I will go over the steps to using a version of the script and some gotchas that I ran into.

In using the script, I found that the name of the downloaded files created by the script works fine if you are running the script and storing the files solely on a machine running a Unix-like operating system (FreeBSD, Linux, Solaris, macOS, etc.), but, issues can crop up if the files will be shared out on an SMB share. I [forked the project](https://github.com/questionlp/bandcamp-downloader) and modified the script to use Windows-friendly file naming.

To use the script, you will need a supported version of Python 3 (3.10 or newer is highly recommended). With a supported version of Python installed, clone the repository and run the following command to create a virtual environment and install all of the required dependencies:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -U pip
pip install .
```

Once installed, you can run `python3 bandcamp-downloader.py --help` from within the virtual environment to view the options and flags available. The options I will cover here will be `--browser`, `--cookies`, `--format`, and `--directory`.

To authenticate and log in with your Bandcamp account, the script can use an existing logged-in session in a supported browser (Firefox and Chromium-based, but not Safari) or an exported `cookies.txt` file. I used the [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/) Firefox add-on to save a copy of the `cookies.txt` file since the server that I will be running the script on does not have any installed browsers.

To use a browser session, pass in the `--browser` option with the applicable browser name. To use an exported `cookies.txt` file, pass in `--cookies` with the path to the `cookies.txt` file.

The `--format` option mirrors the formats that Bandcamp offers when you download music from their website. I recommend downloading your purchases in a lossless format (FLAC, ALAC, AIFF Lossless, or wave) and in a format that is easiest for your phone, portable media player, etc. If you use the script to download multiple formats, provide a different `--directory` path for each format. This is due to the default naming scheme omitting the format name in the resulting zip files.

When running the script, you must also provide your Bandcamp username as an argument.

Before running the script to download your purchases, verify that you have ample disk space on the drive or network share to save the downloaded files.

After the script has finished downloading all of your purchases in the format of your choice, one issue you may encounter is that artist directory names need to be normalized, and running the script on a system that uses case-sensitive filenames will cause problems on systems that do not.

To resolve this issue, on a system that supports case-sensitive filenames, you must either rename any potentially conflicting directory names or consolidate files into one directory.
