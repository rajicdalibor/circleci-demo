#!/usr/bin/env bash
# release the next patch if CIRCLE_BRANCH is release branch

set -eo

RELEASE_PATTERN="^[0-9]+.([0-9]+|x)(.[0-9]+|.x)?$" # Matches patterns like 1.x, 1.1.x, 23.x, 23.212.x, etc.

if [[ "${CIRCLE_BRANCH}" =~ ${RELEASE_PATTERN} ]]; then
  VERSION=$(npm run version --prefix client --silent)
#  echo ${VERSION}
#
#  echo "Configurate git"
#  git config user.email "circleci@onstructive.ch"
#  git config user.name "RELEASE"
#
  echo "Git commit release '${VERSION}'"
#  git add client/package.json client/package-lock.json
#  git commit -m "[skip ci] release '${VERSION}'"
#  git tag ${VERSION}
#
#  git push --set-upstream origin $CIRCLE_BRANCH
#  git push origin --tags
  echo "Releasing"
else
 echo "Skip releasing"
fi
