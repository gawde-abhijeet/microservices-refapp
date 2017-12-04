#!/usr/bin/env bash

IMAGE=orders
GROUP=microsvcs-demo
COMMIT=latest

set -ev

SCRIPT_DIR=$(dirname "$0")

DOCKER_CMD="sudo docker"

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
$DOCKER_CMD run --rm -v $HOME/.m2:/root/.m2 -v $CODE_DIR:/usr/src/mymaven -w /usr/src/mymaven maven:3.2-jdk-8 mvn -DskipTests package

mkdir -p $CODE_DIR/target
sudo chmod -R 777 $CODE_DIR/target

cp -r $CODE_DIR/docker $CODE_DIR/target/docker/
cp -r $CODE_DIR/target/*.jar $CODE_DIR/target/docker/${IMAGE}

REPO=${GROUP}/${IMAGE}
    $DOCKER_CMD build -t ${REPO}:${COMMIT} $CODE_DIR/target/docker/${IMAGE};
