# OpenShift NGINX
[![License badge](https://img.shields.io/badge/license-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Dockerfile description and OpenShift configuration file of the NGINX in order to 
create a docker image and deploy a corresponding NGINX instance for crm-frontend in an OpenShift environment.

## Create the Docker Image

In order to create the proper image you need to have installed docker engine.
The first command is used to generate the docker image from the defined Dockerfile.

```console
docker build -f Dockerfile -t linbiaowen/nginx:latest .
```

It creates the corresponding docker image tagged with linbiaowen/nginx. The next step is
upload the image into a repository (in our case [Docker Hub](https://hub.docker.com/)).
We need to login into our user:

```console
docker login
```

And them push the new created image into our repository

```console
docker push linbiaowen/nginx:latest
```

## OpenShift deployment

To start to work with OpenShift, you need to be registered in the corresponding 
environment.

```console
oc login <OpenShift server>
```

This command will request you the username and password to access to the proper 
OpenShift environment. Now, to deploy a new application based on the current 
configuration files, the first step is the creation of the proper application in 
the OpenShift environment. Just execute the command:

```console
oc new-app -e CRM_BACKEND_SERVER=<hostname of crm-backend service> linbiaowen/nginx:latest --name nginx -o yaml > nginx.yaml
```

The docker image linbiaowen/nginx is deployed publicly
in [Hub Docker public repository](https://hub.docker.com/linbiaowen/nginx/). This 
operation will create the definition of the new application *nginx* with the 
corresponding yaml description file. We do not use this created description file 
but the one that we provided, due to we need to edit the content. You can compare 
the content inside [config folder](https://github.com/linbiaowen/openshift-crm-nginx/tree/master/config) 
folder with the generated one to see the differences. Finally, keep in mind that 
in OpenShift the hostname has the format:

```text
<service name>.<project name>.svc
```

Furthermore, to deploy our *nginx* application just execute the corresponding 
command:

```console
oc create -f config/
```

Last but not least, if we want to delete completely all the resources generated 
with these configuration files, just execute the corresponding command, specifying 
the name of the application that was created in the execution of the ```oc new-app``` 
command:

```console
oc delete all -l app=nginx
```

## License

These scripts are licensed under Apache License 2.0.
# openshift-crm-nginx
# openshift-crm-nginx
