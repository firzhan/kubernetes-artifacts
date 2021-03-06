#!/bin/bash
# ------------------------------------------------------------------------
#
# Copyright 2005-2015 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License

# ------------------------------------------------------------------------

host=172.17.8.102
manager_port=32001

echo "Deploying wso2is service..."
kubectl create -f wso2is-default-service.yaml

echo "Deploying wso2is controller..."
kubectl create -f wso2is-default-controller.yaml

echo -n "Waiting wso2is to launch on http://${host}:${manager_port}"
until $(curl --output /dev/null --silent --head --fail http://${host}:${manager_port}); do
    printf '.'
    sleep 5
done

echo -e "\nWSO2IS launched!"
