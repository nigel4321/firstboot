#!/bin/bash

if [ -e /etc/redhat-release ]; then
        chmod +x ./bootstrap-centos.sh
        ./bootstrap-centos.sh
else
        chmod +x ./bootstrap-ubuntu.sh
        ./bootstrap-ubuntu.sh
fi
