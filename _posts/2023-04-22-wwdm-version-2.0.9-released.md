---
layout: post
title:  "wwdtm Version 2.0.9 Released"
date:   2023-04-22 12:00:00 -0700
tags:   waitwait update
---

I have updated the [wwdtm](https://pypi.org/projects/wwdtm/) library to version 2.0.9, which includes bumping the version of [MySQL Connector/Python](https://dev.mysql.com/doc/connector-python/en/) to 8.0.33 and [NumPy](https://numpy.org) to 1.24.2. The former is done as a very initial step towards support for the upcoming [Python 3.12](https://docs.python.org/3.12/whatsnew/3.12.html) release later in the year.

For library development, I have also bumped the required version of [flake8](https://flake8.pycqa.org/) to 6.0.0 and [Black](https://black.readthedocs.io/en/stable/) to 23.3.0.

On the documentation side, which is hosted at [Read the Docs](https://readthedocs.org) at [docs.wwdt.me](https://docs.wwdt.me), the version of [Sphinx](https://www.sphinx-doc.org/en/master/) has been bumped from 5.3.0 to 6.1.3 and the configured build environment used for the build is now set to use Ubuntu 22.04 and Python 3.10.

The full changelog is available in the [CHANGES.rst](https://github.com/questionlp/wwdtm/blob/main/CHANGES.rst) in the repository.

Up next will be to update the [Wait Wait Stats Page](https://stats.wwdt.me/) and [Wait Wait Stats API](https://api.wwdt.me/) applications up use the new version of the library.
