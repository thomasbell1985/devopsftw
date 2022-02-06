#!/bin/bash
echo "Authenticating with docker..." &&
docker login -u thomasbell -p "$(cat $DOCKER_HUB_CREDENTIALS)" &&
echo "pushing image to the repo..." &&
docker push thomasbell/litecoin