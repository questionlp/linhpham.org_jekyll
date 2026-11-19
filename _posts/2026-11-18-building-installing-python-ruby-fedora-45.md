---
layout: post
title:  "Building and Installing Python and Ruby on Fedora 45"
date:   2026-11-18 16:20:00 -0800
tags:   fedora linux python ruby
---

With the release of Fedora 45, I decided that I wanted a fresh install on both of my laptops after they have been through several upgrades over the past couple of years. Once I got a good baseline environment, including installing [Starship](https://starship.rs/) and switching to Zsh, I moved on to getting my usual versions of [Python](https://www.python.org/) and [Ruby](https://www.ruby-lang.org/) installed using [pyenv](https://github.com/pyenv/pyenv) and [rbenv](https://github.com/rbenv/rbenv).

Unfortunately, that's where I ran into my first snag where [Fedora 45 switched from using OpenSSL 3.5 to OpenSSL 4.0](https://fedoraproject.org/wiki/Changes/OpenSSL40), which introduced some breaking changes that cause problems with building Python and Ruby versions and several packages that depend on symbols and APIs that are not included in the OpenSSL 4.0 version of the `openssl-devel` and `openssl-libs` packages available in Fedora 45.

There are a couple of options available to work around these issues, but I'll highlight two that I have tested. Note that this post targets Fedora's non-Atomic editions and spins.

For Atomic editions and spins, there are other options including [Toolbx](https://containertoolbx.org/), [Dev Containers](https://containers.dev/) and [Homebrew](https://docs.brew.sh/Homebrew-on-Linux) for installing various versions of Python and Ruby without layering on top of the core image.

### Option 1: Installing OpenSSL 3.5 System Packages

When installing the dependencies that are required to build Python and Ruby using [pyenv](https://github.com/pyenv/pyenv/wiki#suggested-build-environment) and [rbenv](https://github.com/rbenv/ruby-build/wiki#suggested-build-environment), the list of packages include `openssl-devel`. For this quick option, you would to install `openssl3-devel` in place of `openssl-devel`.

The drawback of this option is that `openssl3-devel` and `openssl-devel` cannot be installed simultaneously due to conflicting files and paths. If you install a package that requires `openssl-devel`, you would need to first remove `openssl3-devel`, then install `openssl-devel`.

Later, if you need to build another version of Python or Ruby, would yould need to switch out `openssl-devel` with `openssl3-devel`, though you may end up with broken dependencies you'll need to clean up afterwards by doing the swap again.

### Option 2: Building and Installing OpenSSL 3.5 Standalone

For a better long-term approach, a standalone version of OpenSSL 3.5 can be built and installed in a separate location, then used to build and install Python and Ruby using pyenv and rbenv.

#### Building and Installing OpenSSL 3.5

In order to build OpenSSL 3.5 on Fedora, you will need to install several Perl modules that are required to build and install OpenSSL:

```bash
sudo dnf install perl-IPC-Cmd perl-FindBin perl-Pod-Html perl-Time-Piece
```

Once the required Perl modules are installed, the next step is to create a temporary build location, download and extract the latest [OpenSSL 3.5 LTS](https://openssl-library.org/source/) source tarball (version 3.5.9 as of writing), then build and install OpenSSL into a location within your user home directory.

In this case, the temporary build directory will be under `/tmp` and the OpenSSL 3.5 files will be installed under `$HOME/.local/openssl-3.5`. Feel free to change those two locations as needed. Also, if a newer version of OpenSSL 3.5 LTS has been released, replace `3.5.9` with the appropriate version number.

```bash
mkdir -p /tmp/openssl3-build && cd /tmp/openssl3-build
wget https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz
tar xzf openssl-3.5.9.tar.gz && cd openssl-3.5.9

./Configure --prefix="$HOME/.local/openssl-3.5" --openssldir="$HOME/.local/openssl-3.5" --libdir=lib enable-tls1 enable-tls1_1 enable-tls1-method enable-tls1_1-method shared zlib

make
make install_sw

ln -s /etc/ssl/certs $HOME/.local/openssl-3.5/certs
```

The `Configure` command will tell the build scripts to include the required modules and libraries, including TLSv1 and TLSv1.1, as they may still be required by third-party Python packages or Ruby gems.

The symlink to the system's certificate directory is required in order to build and install Ruby and is recommended if your Python scripts need to access any resources that require SSL/TLS.

#### Building and Installing Python Using OpenSSL 3.5

In order to use the standlone version of OpenSSL 3.5 to build and install Python using pyenv, you will need to prefix the `pyenv install` command with:

```bash
PYTHON_CONFIGURE_OPTS="--with-openssl=$HOME/.local/openssl-3.5 --with-openssl-rpath=auto"
```

This will tell the build scripts to reference the libaries and files within the standalone version of OpenSSL rather than using the system's OpenSSL files. This is based on a comment under an [OpenSSL discussion on GitHub](https://github.com/openssl/openssl/discussions/32044#discussioncomment-18000027).

If you do not want to include that prefix every time you want to install a new version of Python, you can export it as an environment variable in your shell's initialization script (such as `.bashrc` or `.zshrc`):

```bash
export PYTHON_CONFIGURE_OPTS="--with-openssl=$HOME/.local/openssl-3.5 --with-openssl-rpath=auto"
```

From here, you can use the installed version(s) of Python via pyenv as you would in any other environment.

#### Building and Installing Ruby Using OpenSSL 3.5

In order to use the standlone version of OpenSSL 3.5 to build and install Ruby using rbenv, you will need to prefix the `rbenv install` command with:

```bash
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$HOME/.local/openssl-3.5"
```

This will tell the build scripts to reference the libaries and files within the standalone version of OpenSSL rather than using the system's OpenSSL files. This is adapted from the README file for [timblair/rbenv-homebrew-openssl](https://github.com/timblair/rbenv-homebrew-openssl/blob/master/README.md).

If you do not want to include that prefix every time you want to install a new version of Ruby, you can export it as an environment variable in your shell's initialization script (such as `.bashrc` or `.zshrc`):

```bash
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$HOME/.local/openssl-3.5"
```

From here, you can use the installed version(s) of Ruby via rbenv as you would in any other environment.

### Option 3: Creating a Toolbx Container

Although I mentioned earlier that I was not targetting Fedora Atomic editions or spins in this post, you can still use the [Toolbx](https://containertoolbx.org/) to create isolated development environments on top of images for any available version of Fedora. This is one of the recommended options for users of Atomic editions and spins, but is also available on non-Atomic editions and spins.

Fedora Workstation 45 includes Toolbx as part of the base installation. If you are using a non-Atomic edition or spin that does not have it installed, run the following command to install it and its dependencies:

```bash
sudo dnf install toolbox
```

With Toolbx installed, you can create an environment named `dev` using the Fedora 44 image by running the following command:

```bash
toolbox create --release 44 dev
```

After the environment has been created, you can then enter it by running:

```bash
toolbox enter dev
```

Since the Fedora 44 image still uses OpenSSL 3, you won't need to juggle between packages for OpenSSL 3 and 4 and you won't need to build and install a standalone version of OpenSSL 3.5. You would just need to install the required dependencies to build Python and Ruby using [pyenv](https://github.com/pyenv/pyenv/wiki#suggested-build-environment) and [rbenv](https://github.com/rbenv/ruby-build/wiki#suggested-build-environment).

The drawback of building and using Python and Ruby within a environment is that you may need to enter into the environment to use either even if you have pyenv and rbenv set up outside and inside the environment.

I did briefly test building Ruby with rbenv within the environment and get it working with Bundler and Jekyll, but it may not work for all use cases.
