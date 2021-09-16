# datasette-aws-lambda-example
This is a rough sketch showing how to deploy datasette on aws lambda.

The example uses spatialite and the datasette-geojson plugin.

It takes advantage of the somewhat recent support for [docker container images](https://docs.aws.amazon.com/lambda/latest/dg/images-create.html) and the [lambda python runtime interface client](https://github.com/aws/aws-lambda-python-runtime-interface-client).

## Next steps
This project probably shouldn't be used directly.

Creating a publish plugin for aws lambda should happen next.

## Running the example
- clone the repository
- set up aws credentials https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html
- install the serverless cli https://www.serverless.com/framework/docs/getting-started
- install docker 
- authenticate the elastic container registry with docker
  `aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account id>.dkr.ecr.<region>.amazonaws.com`
- run `serverless deploy --stage dev`

The serverless command should build and push the docker image to ECR, then deploy the function that uses that image. It also sets up API gateway for the function.

I've used serverless here just because it's easy for prototyping, but other deployment tools should work as well.
