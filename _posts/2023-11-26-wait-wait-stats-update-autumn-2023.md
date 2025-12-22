---
layout: post
title:  "Wait Wait Stats Updates: Autumn 2023"
date:   2023-11-26 20:25:00 -0800
tags:   stats waitwait update
---

Since I last posted an update on listening to [Wait Wait Don't Tell Me!](https://stats.wwtd.me/) episodes from 1998 and 1999, I have not had a chance to listen to more episodes. My time has been split between my day job and working on updates for the Wait Wait Stats projects.

The most significant behind-the-scenes update is dropping support for Python versions earlier than 3.10 and adding support for Python 3.12 across the board. Once Python 3.12 is included in various long-term support distributions, I will increase the minimum version to 3.12 to use many new features introduced in 3.11 and 3.12.

The first component that had to be updated was the [wwdtm](https://github.com/questionlp/wwdtm) library, which included replacing the date parsing code to move away from the [python-dateutil](https://pypi.org/project/python-dateutil/) third-party library to the built-in `datetime` module.

Additional updates to the library include updating required versions for both [MySQL Connector/Python](https://dev.mysql.com/doc/connector-python/en/) and [NumPy](https://numpy.org). The Sphinx documentation generator version was also updated to version 7.2.6. In addition, the Read the Docs build configuration was updated to use Python 3.12. The library documentation is available at [docs.wwdt.me](https://docs.wwdt.me).

Once the new version of the library was [published](https://pypi.org/project/wwdtm/) to PyPI, I updated the Wait Wait Stats API, the Wait Wait Graphs, and the Wait Wait Stats applications to use the new library version. The Wait Wait Reports Site and ancillary scripts do not use the library, but they were updated to use the same version of MySQL Connector/Python and NumPy for consistency.

For more information on the changes, take a look at the release notes linked below:

* Wait Wait Stats Library: [v2.5.0](https://github.com/questionlp/wwdtm/releases/tag/v2.5.0)
* Wait Wait Stats API: [v2.6.0](https://github.com/questionlp/api.wwdt.me_v2/releases/tag/v2.6.0)
* Wait Wait Graphs: [v2.6.0](https://github.com/questionlp/graphs.wwdt.me/releases/tag/v2.6.0)
* Wait Wait Reports: [v2.7.0](https://github.com/questionlp/reports.wwdt.me/releases/tag/v2.7.0)
* Wait Wait Stats: [v5.7.0](https://github.com/questionlp/stats.wwdt.me/releases/tag/v5.7.0)
