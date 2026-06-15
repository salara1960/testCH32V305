#!/bin/bash

if [ "$#" -eq 1 ] ; then
    sudo isp_cmd -p /dev/ch37x1 -o program -c v305.ini -f $1
fi
