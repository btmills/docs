---
layout: documentation
title: Install RethinkDB on CentOS
title_image: /assets/images/docs/install-platforms/centos.png
active: docs
docs_active: install
permalink: docs/install/centos/
---
{% include install-docs-header.md %}

# With binaries #

We provide binaries for both 32-bit and 64-bit CentOS 6.

To install the server, add the [RethinkDB yum repository](http://download.rethinkdb.com/centos) to your list of repositories and install:

```bash
sudo wget http://download.rethinkdb.com/centos/6/`uname -m`/rethinkdb.repo \
          -O /etc/yum.repos.d/rethinkdb.repo
sudo yum install rethinkdb
```
# Compile from source with the Epel repository #

These instructions have been tested on CentOS 6.5.

## Get the build dependencies ##

CentOS provides neither a protobuf-devel package nor jemalloc-devel, so we need to get them
from the Epel repository:


```bash
sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

Centos 6 also has a version of GCC that is too old. A newer version can be installed using devtoolset:

```bash
rpm --import http://ftp.scientificlinux.org/linux/scientific/5x/x86_64/RPM-GPG-KEYs/RPM-GPG-KEY-cern
sudo wget -O /etc/yum.repos.d/slc6-devtoolset.repo http://linuxsoft.cern.ch/cern/devtoolset/slc6-devtoolset.repo
```

Install the main dependencies:

TODO: only devtoolset-2-gcc-c++-4.8.2 ?

```
sudo yum install devtoolset-2 ncurses-devel boost-static openssl-devel \
                 protobuf-devel jemalloc-devel libcurl-devel wget tar which
```

## Get the source code ##
Clone RethinkDB repository:

```bash
wget http://download.rethinkdb.com/dist/rethinkdb-latest.tgz
tar xf rethinkdb-latest.tgz
```

## Build RethinkDB ##

Kick off the build process:

```bash
cd rethinkdb-*
scl enable devtoolset-2 -- ./configure --dynamic jemalloc --fetch protobuf
scl enable devtoolset-2 -- make
```

# Compile from source without the Epel repository #

These instructions have been tested on CentOS 6.5.

## Get the build dependencies ##

Install the main dependencies:

```
sudo yum install git-core gcc-c++ ncurses-devel boost-static svn
```

## Get the source code ##

Clone RethinkDB repository:

```bash
git clone --depth 1 -b v{{site.version.major}}.x https://github.com/rethinkdb/rethinkdb.git
```

## Build RethinkDB ##

Kick off the build process:

```
cd rethinkdb
./configure --fetch protoc --fetch npm --fetch tcmalloc_minimal
make
```


{% include install-next-step.md %}
