#!/usr/bin/env bash
# release the next patch if CIRCLE_BRANCH is release branch

set -eo

echo "Prepare release"
npm version patch --prefix client

