# Confluent Tools

[![Build Status](https://travis-ci.org/devshawn/confluent-tools.svg?branch=master)](https://travis-ci.org/devshawn/confluent-tools) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)



Kafka, Zookeeper, and Confluent's command-line tools in a docker image. 

## Overview
This is a docker image that provides the confluent platform tools. This can be utilized to run the Kafka, Zookeeper, or Confluent tools locally without having to install them. It can also be deployed alongside Kafka & Zookeeper so one can utilize the tools in a live setting. It's also quite useful for running these tools on Windows machines.

## Getting Started
Ensure you have Docker installed. Pull down the image:

```bash
docker pull devshawn/confluent-tools
```

### Singleton mode
If you just need to run a command locally and don't need to keep the container running, you can execute commands without a background daemon container. 

```bash
docker run --net=host -it --entrypoint run devshawn/confluent-tools {cmd}
```

For example, listing Kafka topics with local zookeeper running:

```bash
docker run --net=host -it --entrypoint run devshawn/confluent-tools kafka-topics --list --zookeeper localhost:2181
```

### Daemon mode

The container can be run in daemon mode and act as a running machine with the tools installed. Start the container:

```bash
docker run -d --name confluent-tools --net=host devshawn/confluent-tools
```

The container will now be running. We set the following properties:

- **-d**: run container in daemon mode
- **--name**: set the container name
- **--net=host**: run container with access to localhost (i.e. kafka running locally)

#### Execute Single Commands

You can run single commands such as:

```bash
docker exec -it confluent-tools {cmd}
```

For example, listing Kafka topics with local zookeeper running:

```bash
docker exec -it confluent-tools kafka-topics --list --zookeeper localhost:2181
```

#### Executing Commands 
If you're going to be running a lot of commands, it's easier to run them from inside of the container. First, open a shell inside of the container:

```bash
docker exec -it confluent-tools /bin/bash
```

You'll now see something such as:

```bash
bash-4.4#
```

From here, run commands as if they were on your local machine. For example, listing Kafka topics with a local zookeeper running:

```bash
kafka-topics --list --zookeeper localhost:2181
```

## Ackowledgements
This project was made to make utilizing the confluent tools easier on local machines. All credit to the Confluent team and many open source contributors. ❤️
- [Apache Kafka][kafka]
- [Apache Zookeeper][zookeeper]
- [Confluent][confluent]

## License
This project is licensed under the [Apache 2.0 license][license]. Apache Kafka and Apache Zookeeper are licensed under the [Apache 2.0 license][apache2] as well. Any Confluent products or tools are licensed under the [Confluent Community License][ccl]. 

[kafka]: https://kafka.apache.org/
[zookeeper]: https://zookeeper.apache.org/
[confluent]: https://www.confluent.io
[license]: LICENSE
[apache2]: https://www.apache.org/licenses/LICENSE-2.0
[ccl]: https://www.confluent.io/confluent-community-license
