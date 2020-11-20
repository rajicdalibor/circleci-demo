#!/usr/bin/env bash
# release the next patch if CIRCLE_BRANCH is release branch

set -eo

RELEASE_PATTERN="^[0-9]+.([0-9]+|x)(.[0-9]+|.x)?$" # Matches patterns like 1.x, 1.1.x, 23.x, 23.212.x, etc.

if [[ "${CIRCLE_BRANCH}" =~ ${RELEASE_PATTERN} ]]; then
  echo "Prepare release"
  npm version patch --prefix client
else
 echo "Skip prepare release"
fi
