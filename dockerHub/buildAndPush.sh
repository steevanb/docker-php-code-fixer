#!/usr/bin/env sh

readonly PROJECT_DIRECTORY=$(realpath $(dirname $(realpath $0))/..)

tag=$1
isLatest=$2

if [ "$tag" = "" ]; then
    read -p "Tag name? " tag
fi

if [ "$isLatest" = "" ]; then
    read -p "Tag latest too? [Y/n] " isLatest
fi

buildAndPush() {
    docker build $PROJECT_DIRECTORY -t steevanb/php-code-fixer:$1
    docker login
    docker push steevanb/php-code-fixer:$1
}

buildAndPush "$tag"
if [ "$isLatest" = "" ] || [ "$isLatest" = "Y" ] || [ "$isLatest" = "y" ]; then
    buildAndPush "latest"
fi
