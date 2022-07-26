#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "SCRIPT_DIR: $SCRIPT_DIR"

# shellcheck source=./shared/get_release_branch_version.sh
source "$SCRIPT_DIR/shared/get_release_branch_version.sh"

git config user.email "david.vonknobelsdorff@dm.de"
git config user.name "David v.Knobelsdorff"

git add RNPrebuilt.podspec || exit 1
git add RNPrebuilt-Debug.podspec || exit 1
git commit -m "Update podspecs version to $release_branch_version [skip ci]" || exit 1
git push || exit 1
