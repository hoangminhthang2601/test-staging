#!/bin/bash
CURRENT_DIR=$PWD
set -e

    echo "### Change directory to scripts ... ###"
    cd $WORKING_DIR/jenkins/scripts

    echo "Linting test ..."
    docker-compose -f docker-compose-be.yml run --rm be sh -c "flake8"

    echo "Run unittest ..."
    docker-compose -f docker-compose-be.yml run --rm be sh -c "coverage run -m pytest tests -v && coverage report --fail-under=80"

    echo "### Testting is completed ...###"
    cd $CURRENT_DIR