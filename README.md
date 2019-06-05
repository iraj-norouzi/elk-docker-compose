# elk-docker-compose

Small docker-compose project to get an ElasticSearch + Logstash + Kibana stack up and running quickly. Meant for playing around at home or in a lab.

## Getting Started

Clone the repo to your local machine

```bash
$ git clone https://github.com/acidDrain/elk-docker-compose.git
Cloning into 'elk-docker-compose'...
remote: Enumerating objects: 96, done.
remote: Counting objects: 100% (96/96), done.
remote: Compressing objects: 100% (63/63), done.
remote: Total 96 (delta 41), reused 77 (delta 29), pack-reused 0
Receiving objects: 100% (96/96), 23.31 KiB | 0 bytes/s, done.
Resolving deltas: 100% (41/41), done.
```

Next, navigate to the directory and run `docker-compose up --build`

```bash
$ cd elk-docker-compose
$ docker-compose up --build
Creating network "elk-docker-compose_esnet" with the default driver
Creating volume "elk-docker-compose_esdata1" with default driver
Building elasticsearch
Step 1/1 : FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4
 ---> 93109ce1d590

Successfully built 93109ce1d590
Successfully tagged elk-docker-compose_elasticsearch:latest
Building logstash
Step 1/1 : FROM docker.elastic.co/logstash/logstash:6.5.4
6.5.4: Pulling from logstash/logstash
a02a4930cb5d: Already exists
3a1e4174c6a2: Pull complete
a45580ada7cb: Pull complete
85783b3810d1: Pull complete
30c254b18180: Pull complete
583ceb4bc726: Pull complete
d1d6aa33e493: Pull complete
5d470174a592: Pull complete
0538316f0c3c: Pull complete
77e7b1a9620e: Pull complete
18467bd04a72: Pull complete
Digest: sha256:aeb0cc317b51b01ac90216726ba6e636da9fbb5285056b2ffc81e7ee0539faf2
Status: Downloaded newer image for docker.elastic.co/logstash/logstash:6.5.4
 ---> ac1d36dfa416

Successfully built ac1d36dfa416
Successfully tagged elk-docker-compose_logstash:latest
Building kibana
Step 1/1 : FROM docker.elastic.co/kibana/kibana:6.5.4
 ---> 3c8a8603d365

Successfully built 3c8a8603d365
Successfully tagged elk-docker-compose_kibana:latest
```

## Accessing Kibana

Kibana will be exposed on port `5601`.

To access Kibana, open a browser and navigate to `http://localhost:5601/`

## Troubleshooting Problems with ElasticSearch Starting

Sometimes there an be an issue with ElasticSearch starting up - this is typically related to permissions issues with the volume mount. The docker-compose conifguration sets ElasticSearch to use a volume for data persistence, the folder in this project is esdata1. It should be owned by uid/guid 1000. If there are an permissions issues, they should easily be resolved with:

```bash
$ sudo chown -R 1000:1000 esdata1

```
