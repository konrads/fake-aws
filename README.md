fake-aws
========

Local implementations of AWS services:
* DynamoDB
* S3
* ElasticCache (redis)

Creates necessary docker images, containers, populates data.

To run:
```bash
# (re)build images and containers, populate data
> bin/fake-aws refresh all
# or once images are created
> bin/fake-aws refresh containers

# populate fake-aws from the host
> bin/data-gen uat example/aws-templates example/aws-stage
> data_dir=example/aws-stage dynamodb_host=192.168.99.100 s3_host=192.168.99.100 redis_host=192.168.99.100 bin/aws-populate refresh all
```

Snags
-----
If image build hangs with `Setting up ca-certificates-java (20140324) ...`, try the workaround from https://github.com/docker/docker/issues/18180:
```bash
docker-machine rm default
docker-machine create -d virtualbox --virtualbox-boot2docker-url=https://github.com/boot2docker/boot2docker/releases/download/v1.9.0/boot2docker.iso default
```
