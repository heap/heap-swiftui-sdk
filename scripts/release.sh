#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

set -o errexit
set -o pipefail

if [[ "undefined$1" = "undefined" ]]
then
echo "Usage: $0 HEAP_SWIFTUI_VERSION"
exit 1
fi

HEAP_SWIFTUI_VERSION=$1
REQUIRED_BRANCH=$(echo "$HEAP_SWIFTUI_VERSION" | awk '{if ( $0 ~ /-/ ) { print "prerelease" } else { print "main" }}')
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ "$CURRENT_BRANCH" != "$REQUIRED_BRANCH" ]]
then
echo "You must run this script from the $REQUIRED_BRANCH branch.  You are currently on $CURRENT_BRANCH."
exit 1
fi

if [[ $(git status --porcelain) ]]; then
echo "You cannot run this script with uncommitted changes."
exit 1
fi

if [[ `git status -sb` == *ahead* ]]
then
echo "You cannot run this script with unpushed changes."
exit 1
fi

git pull origin "$CURRENT_BRANCH" --ff-only
 git fetch --all --tags

if [[ $(git tag -l "$HEAP_SWIFTUI_VERSION") = "$HEAP_SWIFTUI_VERSION" ]]
then
echo "The $HEAP_SWIFTUI_VERSION tag already exists."
exit 1
fi

if [[ $(grep "heap-swiftui-$HEAP_SWIFTUI_VERSION.zip" ../Package.swift)  ]]
then
:
else
echo "Package.swift does not reference heap-swiftui-$HEAP_SWIFTUI_VERSION.zip."
exit 1
fi

git tag "$HEAP_SWIFTUI_VERSION"
git push origin "$HEAP_SWIFTUI_VERSION"
