---
layout: documentation
title: Sharding and replication
active: docs
docs_active: sharding-and-replication
permalink: docs/sharding-and-replication/
---

<img alt="Sharding and Replication Illustration" class="api_command_illustration"
    src="/assets/images/docs/api_illustrations/shard-and-replicate.png" />

RethinkDB allows you to shard and replicate your cluster on a per-table basis. Settings can be controlled easily from the web administration console. In addition, ReQL commands for table configuration allow both scripting capability and more fine-grained control over replication, distributing replicas for individual tables across user-defined groups of servers using server tags.

{% infobox info %}

__Note__: Currently, RethinkDB implements range shards, but will eventually be
switching to hash shards. Follow [Github issue #364][gh364] to track progress.

[gh364]: https://github.com/rethinkdb/rethinkdb/issues/364

{% endinfobox %}

# Sharding and replication via the web console #

When using the web UI, simply specify the number of shards you want, and based on the data available RethinkDB will determine the best split points to maintain balanced shards. To shard your data:

- Go to the table view (_Tables_ &rarr; _table name_).
- Set the number of shards and replicas you would like.
- Click on the _Apply_ button.

![Shard with the web interface](/assets/images/docs/administration/shard.png)

# Sharding and replication via ReQL #

There are three primary commands for changing sharding and replication in ReQL. In addition, there are lower-level values that can be changed by manipulating [system tables](/docs/system-tables/).


* The [table_create](/api/python/table_create) (or [tableCreate](/api/javascript/table_create)) command can specify initial values for `shards` and `replicas`.
* The [table_config](/api/python/table_config) (or [tableConfig](/api/javascript/table_config)) command can change the values for `shards` and `replicas` for an existing table.
* The [rebalance](/api/python/rebalance) command will rebalance table shards.

For more information about administration via ReQL, consult the API documentation for the individual commands as well as the [Administration tools](/docs/administration-tools/) documentation.

