# DevOps Challenge

Fork this project and build the infrastructure of this API the way you want, you can use Docker Compose, AWS or any other way you like, the goal here is to analyze your commits to understand the way you work.

You have one week to complete the test, when you're done send an email to [anderson.lima@shawandpartners.com](mailto:anderson.lima@shawandpartners.com)
We will schedule a meeting for you to explain your solution

Tips:

The application runs on port 8888

This app only has two endpoints, the / which returns the following string:

```jsx
{"App Test": "Alive"}
```

And the Healthcheck endpoint that returns the following string:

```jsx
{"Status": "heart beating steady and strong"}
```

Run the application
```jsx
pip install -r src/requirements.txt
cd src
gunicorn --bind 0.0.0.0:8888 wsgi:app
```



Any questions please contact: [anderson.lima@shawandpartners.com](mailto:anderson.lima@shawandpartners.com)



# Answer DevOps Challenge

### Docker Container
Was create a Dockerfile to run the application in container.

### Terraform Configuration
To run the test locally was not setup the Terraform backend to use a S3, but the best practices recommend to use one S3 and differents keys for each part of the modules.

### The environment
Was choose tho answer this challenge the option to use Terraform and AWS, the environment was created fallowing the best practices.

* Create a new VPC
* Create Subnets Publics, Privates and for Databases
* Create all the routes and Gateways

### The ECS Cluster
The cluster and the task definition was create a simple example to run the application, all the dependencies was created:

* Security Groups
* IAM 
* ECR
* ECS Cluster
* ECS Task definition.

