# Setting up a AWS CodePipeline to Amazon ECS


Hosting a Java Web App in a Tomcat Container to ECS and setup a CI/CD to ECS with AWS CodePipeline

#### Prerequisites:
- Application Load Balancer (Listener 8080)
- Target Groups (Target Type - IP)
- Java Web Application source in SVN. 

## Writing Docker file

Dockerfile to build and host the Application Image.

## Writing buildspec.yml

buildspec is where the build process is defined. Buildspec can also be used to build the Java Web Application and COPY directive can be used in the Dockerfile to host the war artifact.
The buildspec builds the Dockerfile, pushes the image to Amazon ECR.

## Writing appsec.yml

appspec.yml is used by CodeDeploy to deploy the application.

## Task Definition

Create a taskdef.json. Task definition contains container definitions, network and other hardware specifications.


## Register Task Definition

    $ aws ecs register-task-definition --cli-input-json file://taskdef.json

## ECS Task Execution Policy

#### ECS Task Execution Policy Role Specifications

- AmazonECSTaskExecutionRolePolicy

## Create a ECS Cluster

## ECS Service

Be sure to update Target Group ARN, AWS VPC Configuration block.

## Create Service

    $ aws ecs create-service --service-name service1 --cli-input-json file://create-service.json

## CodeBuild

#### Environment Specifications for CodeBuild

Spec | Value
--- | ---
Image | aws/codebuild/standard:2.0
Environment Type | Linux
Privileged | True

Note: Privileged Environment comes with Docker installed.

## CodeDeploy

#### CodeDeploy Specifications

Spec | Value
--- | ---
Compute Platform | Amazon ECS
Deployment Type | Blue/Green
Compute Platform | Amazon ECS

#### CodeDeploy IAM Role Permission Policies

- AWSCodeDeployRoleForECS

![CodeDeploy Success](https://raw.githubusercontent.com/dannybritto96/ECSCodePipeline-JavaWebApp/master/CodeDeploy.PNG)

![Pipeline Success](https://raw.githubusercontent.com/dannybritto96/ECSCodePipeline-JavaWebApp/master/Pipeline.PNG)
