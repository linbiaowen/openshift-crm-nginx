#!/bin/bash

# change the crm-backend server by the environment variable
sed -i.bak "s/crm-backend-app/$CRM_BACKEND_SERVER/" /etc/nginx/nginx.conf
