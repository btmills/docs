---
layout: documentation
title: Administration UI
active: docs
docs_active: administration-tools
permalink: docs/administration-tools/
alias: docs/guides/administration/
js: fancybox
---

RethinkDB provides a web interface which lets you manage your entire server cluster, from controlling sharding and replication to running ReQL queries (in JavaScript), with editing and history support. In addition, you can perform administration tasks using ReQL with Python or Ruby.

# The web interface #

<a class="screenshot-thumbnail" href="/assets/images/docs/administration/webui.png"><img src="/assets/images/docs/administration/thumbnails/webui.png" /></a>

Once RethinkDB is running, you can connect to it at <http://localhost:8080>, assuming you've kept the default port (8080) and it's running on your local machine.

By default, RethinkDB binds the web interface to `localhost` for security reasons. If you need to be able to access it from another server, use the `--bind all` parameter when starting RethinkDB. Read how to [Start a cluster][sc] or [Create a cluster on system startup][cc].

[sc]: /docs/start-a-cluster/
[cc]: /docs/cluster-on-startup/

# Scripting administration tasks #

If you have the Python or Ruby [client drivers][cd] installed, you can use the Python or Ruby REPL to perform all administration tasks. There are commands for [configuring sharding and replication](/api/python/reconfigure), [rebalancing shards](/api/python/rebalance) and more. In addition, you can query [system tables](/docs/system-tables/) to get information about your cluster and to change many of its operational characteristics.

For more information, read [Scripting RethinkDB][sr].

[cd]: /docs/install-drivers/
[sr]: /docs/scripting-rethinkdb/