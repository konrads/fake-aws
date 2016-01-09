fake-aws
========

Local implementations of AWS services:
* DynamoDB
* S3
* ElasticCache (redis)

Creates docker images:
* dynamodb
* s3
* redis, ie. elasticache
* client, with tools: aws-cli, redis, jq

The executable scripts are:
* fake-aws - creates images and containers, runs *some* commands in the client container
* data-gen - generates data from a template dir (from `example/aws-template`), substituting tokens from both file names and contents:
  * {{prefix}} - provided prefix, eg. user1/uat/stage/prod
  * {{yyyymm}} - today's year and month, eg. 201601
  * {{yyyy-mm-dd}} - today's year, month and day, eg. 2016-01-07
  * {{yyyy-mm-dd-5}} - today's year, month and day, minus 5 days, eg. 2016-01-02
  * {{ts}} - current's timestamp, ie. seconds from epoch, eg. 1452369900
  * {{ts-60}} - current's timestamp a minute ago, eg. 1452369840
* aws-populate - populates data from dir structure (potentially generated with `data-gen`):
```
data-dir
  |
  +-- dynamodb
  |     |
  |     +-- schema
  |     |     |
  |     |     +-- <table1>.schema.json
  |     |     |
  |     |     +-- <table2>.schema.json
  |     |
  |     +-- data
  |           |
  |           +-- <table1_contents>.json
  |           |
  |           +-- <table2_contents>.json
  |
  +-- s3
  |     |
  |     +-- bucket1
  |     |     |
  |     |     +-- /some/path/to/file1
  |     |
  |     +-- bucket2
  |           |
  |           +-- /some/path/to/file2
  |           |
  |           +-- /some/path/to/file3
  |
  +-- redis
        |
        +-- <commands1>.redis.cmds
        |
        +-- <commands2>.redis.cmds
```

`aws-populate` can be run from host, requiring following tools on the host: `aws-cli`, `redis`, `jq`.  It can be run on both real aws and fake-aws. If targeting fake-aws from the host, set up `dynamodb_host`/`s3_host`/`redis_host` vars to point at local containers: `localhost` on linux, `192.168.99.100` on MacOS. Alternatively, running from the client container, which has all env preconfigured. `aws-populate` can also target real aws from the host, no env configuration is required.

To run
------
```bash
# (re)build images and containers, populate data
> bin/fake-aws refresh all
# or once images are created
> bin/fake-aws refresh containers

# generate data from templates
> bin/data-gen uat example/aws-templates example/aws-stage

# populate dynamodb, s3 & redis, on: fake from host, fake from client, real from host
> data_dir=example/aws-stage dynamodb_host=192.168.99.100 s3_host=192.168.99.100 redis_host=192.168.99.100 bin/aws-populate refresh all
> bin/fake-aws populate all example/aws-stage
> data_dir=example/aws-stage bin/aws-populate refresh all

# list dynamodb, s3 & redis, on: fake from host, fake from client, real from host
> data_dir=example/aws-stage dynamodb_host=192.168.99.100 s3_host=192.168.99.100 redis_host=192.168.99.100 bin/aws-populate list all
> bin/fake-aws list all
> data_dir=example/aws-stage bin/aws-populate list all
```

Snags
-----
If image build hangs with `Setting up ca-certificates-java (20140324) ...`, try the workaround from https://github.com/docker/docker/issues/18180:
```bash
docker-machine rm default
docker-machine create -d virtualbox --virtualbox-boot2docker-url=https://github.com/boot2docker/boot2docker/releases/download/v1.9.0/boot2docker.iso default
```
