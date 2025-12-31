---
layout: post
title:  "Wait Wait Stats Apps Updated"
date:   2023-02-16 08:45:00 -0800
tags:   stats waitwait update
---

One of the dependencies for the [Flask](https://flask.palletsprojects.com/) framework, [Werkzeug](https://werkzeug.palletsprojects.com/), was updated to fix a security vulnerability that can be exploited in a DoS attack. Since the Wait Wait Stats Page, Wait Wait Stats Graphs site, and the Wait Wait Reports site all depend on Flask, I have updated the required version of Flask and Werkzeug to 2.2.3 for both.

The changes have been published to their respective GitHub-hosted repositories and the instances of applications running on the production server have been updated.
