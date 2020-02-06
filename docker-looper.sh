#/bin/bash

IMAGE_NAME=$1
LABEL=$2
DOCKER_ARGS=$3

echo "Starting docker looper!"
echo " Image: $IMAGE_NAME"
echo " Label: $LABEL"
if [[ "$DOCKER_ARGS" != "" ]]; then
  echo " Docker args: $DOCKER_ARGS"
fi

while true
do
  STATUS=$(docker ps -f "label=$LABEL" | tail -n +2 | wc -l)
  if [[ $STATUS == 0 ]]; then
    DATE=$(date +"[%m-%d-%Y %H:%M]")
    docker pull "$IMAGE_NAME" >> /dev/null
    BUILD_DATE=$(docker image inspect $IMAGE_NAME --format "{{ .Created }}")
    echo "$DATE Starting app, build time: $BUILD_DATE"
    docker run -d --rm \
        --name $LABEL \
        --label $LABEL \
        $DOCKER_ARGS $IMAGE_NAME >> /dev/null
  fi
  sleep 5
done
