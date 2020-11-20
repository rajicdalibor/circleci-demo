#!/usr/bin/env bash
# release the next patch if CIRCLE_BRANCH is release branch

set -eo

RELEASE_PATTERN="master" # Matches master branch

if [[ "${CIRCLE_BRANCH}" =~ ${RELEASE_PATTERN} ]]; then
  echo "Prepare release"
  npm version patch --prefix client
else
 echo "Skip prepare release"
fi
