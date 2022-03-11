#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

set -o errexit
set -o pipefail

TMP_DIR=$(mktemp -d -t heap-swiftui-sdk)
cd ..
PATH_TO_HEAP_SWIFTUI="$PWD"
cd -

unzip resources/ReleaseTester.zip -d "$TMP_DIR"
cd "$TMP_DIR/ReleaseTester"

sed -i '' "s#PATH_TO_HEAP_SWIFTUI#${PATH_TO_HEAP_SWIFTUI}#" Package.swift
xcodebuild clean build -scheme ReleaseTester -destination 'platform=iOS Simulator,OS=latest,name=iPhone 12' |xcpretty

