#!/bin/bash
if ! which virtualenv 1> /dev/null 2>&1
then
    echo "You must have python-virtualenv installed in order to continue!"
    exit 1
fi

mkdir -p ./pypng
virtualenv ./pypng
source ./pypng/bin/activate
pip install pypng
deactivate
exit 0
