#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
VERSION_FILE="$LOCAL_REPO/vendor/cm/config/version.mk"

pushd $(dirname "$VERSION_FILE")

  sed -i 's#UberCM#UberSultan#' "$VERSION_FILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Renaming ROM to UberSultan :)"

popd