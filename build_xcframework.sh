#!/bin/bash

set -euo pipefail

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin/:$PATH"

function archive() {
    xcodebuild archive \
    -workspace $PROJECT.xcworkspace \
    -scheme $PROJECT \
    -archivePath $SRCROOT/$PROJECT-iphonesimulator.xcarchive \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO

 xcodebuild archive \
    -workspace $PROJECT.xcworkspace \
    -scheme $PROJECT \
    -archivePath $SRCROOT/$PROJECT-iphoneos.xcarchive \
    -sdk iphoneos \
    SKIP_INSTALL=NO 
}

function create_xcframework() {
    rm -rf $SRCROOT/Frameworks
    mkdir $SRCROOT/Frameworks

    for framework in $(find $SRCROOT/$PROJECT-iphonesimulator.xcarchive/Products/Library/Frameworks -type d -name "*.framework");
    do
        basename=$(basename $framework)
        framework_name=$(basename $framework .framework)
        xcodebuild -create-xcframework \
            -framework $SRCROOT/$PROJECT-iphonesimulator.xcarchive/Products/Library/Frameworks/$basename \
            -framework $SRCROOT/$PROJECT-iphoneos.xcarchive/Products/Library/Frameworks/$basename \
            -output $SRCROOT/Frameworks/$framework_name.xcframework
    done

    tar -cvzf $PROJECT.tar.gz Frameworks
}

function clean() {
    # Clean Up
    rm -rf $SRCROOT/$PROJECT-iphoneos.xcarchive
    rm -rf $SRCROOT/$PROJECT-iphonesimulator.xcarchive
    rm -rf $SRCROOT/Frameworks
}

function distribute() {
    gh release create "$1" --generate-notes -R "traveloka/ios-rn-prebuilt"
    gh release upload "$1" $PROJECT.tar.gz -R "traveloka/ios-rn-prebuilt" && rm -rf $PROJECT.tar.gz 

    pod repo push traveloka ios-rn-prebuilt.podspec --verbose --allow-warnings --skip-tests
}

cd $SRCROOT
version=$(cat ios-rn-prebuilt.podspec | grep version | sed -n 's/version.=."\(.*\)".*/\1/p' | xargs)

archive
create_xcframework
clean
distribute $version