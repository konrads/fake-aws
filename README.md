fake-aws
========

Local implementations of AWS services:
* DynamoDB
* S3
* ElasticCache (redis)

Creates necessary docker images, containers, populates data.

To run:
```bash
# refresh docker containers
> bin/fake-aws refresh all

# populate data for docker-machine's host 192.168.99.100
> data_dir=example/aws-data endpoint_host=192.168.99.100 bin/aws-populate refresh all
```
