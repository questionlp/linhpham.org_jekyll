---
layout: post
title:  "Wait Wait Stats Updates: May 2023"
date:   2023-05-03 14:00:00 -0700
tags:   waitwait update
---

In the past couple of weeks, I published updates to the [wwdtm](https://github.com/questionlp/wwdtm) library, and the [Wait Wait Stats Page](https://stats.wwdt.me/), [Wait Wait Reports](https://reports.wwdt.me/) and [Wait Wait Graphs](https://graphs.wwdt.me/) web applications.

For version 2.1.0 of the wwdtm library, I have consolidated the pytest configuration into the project's `pyproject.toml` file and migrated away from using `setup.cfg` and `setup.py` for package building.

Both the Wait Wait Stats Page and Wait Wait Graphs web applications have been updated to use the new version of the wwdtm library and had their Flask dependencies updated to use [Flask 2.3.2](https://github.com/pallets/flask/releases/tag/2.3.2). The same updating of the Flask dependencies have been made for the Wait Wait Reports web application as well.

The Wait Wait Stats API did receive a recent update to use version 2.0.9 of the wwdtm library. Since version 2.1.0 does not contain any new features or bugfixes, the API will not be updated to use version 2.1.0.

See the links below to each of the new releases published on GitHub:

- [wwdtm](https://github.com/questionlp/wwdtm/releases/tag/v2.1.0)
- [api.wwdt.me_v2](https://github.com/questionlp/api.wwdt.me_v2/releases/tag/v2.1.3)
- [graphs.wwdt.me](https://github.com/questionlp/graphs.wwdt.me/releases/tag/v2.2.5)
- [reports.wwdt.me](https://github.com/questionlp/reports.wwdt.me/releases/tag/v2.2.5)
- [stats.wwdt.me](https://github.com/questionlp/stats.wwdt.me/releases/tag/v5.3.0)
