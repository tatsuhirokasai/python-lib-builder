#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Error: specify the Python version as the first argument."
    exit 1
fi

# rm -Rf $PWD/python/*
docker build -t python-lib-builder-image . --build-arg PYTHON_VERSION="$1"
docker run -v "$PWD":/var/task --rm python-lib-builder-image /bin/bash -c "source ~/.bashrc; pip install -r /var/task/requirements.txt -t /var/task/python; exit"
