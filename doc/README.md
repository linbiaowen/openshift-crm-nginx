# Quick reference

-	**Where to get help**:  
	[the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack/)

-	**Where to file issues**:  
	[https://github.com/linbiaowen/openshift-crm-nginx/issues](https://github.com/linbiaowen/openshift-crm-nginx/issues)

-	**Maintained by**:  
	[the OpenShift Docker Maintainers](https://github.com/linbiaowen/openshift-crm-nginx)

-	**Source of this description**:  
	[docs OpenShift NGINX directory](https://github.com/linbiaowen/openshift-crm-nginx/blob/master/doc) ([history](https://github.com/linbiaowen/openshift-crm-nginx/commits/master/doc))

-	**Supported Docker versions**:  
	[the 18.06.0-ce release](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce) 
	(down to 18.06.0-ce on a best-effort basis)

# What is this nginx image

This docker image has been generated for crm-frontend
and installed with unprivileged status in order to deploy it in OpenShift.

# How to use this image

## Hosting a simple docker service locally

In order to create the proper image just execute:

```console
docker build -f Dockerfile -t linbiaowen/nginx:latest $PWD
```

Just the next step is to upload the image to the current repository:

```console
docker push linbiaowen/nginx:latest
```

Alternatively, to run this docker image just execute the following commands:

```console
docker run --name <some container name> -e CRM_BACKEND_SERVER=<ENV_VRRIABLE VALUE> <docker image ID>
```

This will create a container listening on port 8080

## OpenShift deployment

It is possible to deploy this docker image inside a OpenShift instance, just 
selecting deploy image and specifying the proper Image Name. In this case,
the value of the Image name or pull spec is **docker.io/linbiaowen/nginx:latest**


### Using environment variables in nginx configuration

There is a environment variable that has to be defined when we deploy this 
image. Here is an example using docker-compose.yml:

```yaml
web:
  image: nginx
  ports:
   - "8080:8080"
  environment:
   - CRM_BACKEND_SERVER=<ENV VARRIABLE VALUE>
```

# License

View [license information](http://nginx.org/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under 
other licenses (such as Bash, etc from the base distribution, along with any direct or 
indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that 
any use of this image complies with any relevant licenses for all software contained 
within.

For the additional configuration content defined in this repo, view license information contained in the
repository [license information](https://github.com/linbiaowen/openshift-crm-nginx/blob/master/LICENSE).