#!/usr/bin/env bash
# release the next patch if CIRCLE_BRANCH is release branch

set -eo

RELEASE_PATTERN="master" # Matches master branch

if [[ "${CIRCLE_BRANCH}" =~ ${RELEASE_PATTERN} ]]; then
  VERSION=$(npm run version --prefix client --silent)

  echo "Configurate git"
  git config user.email "rajicdalibor@yahoo.com"
  git config user.name "rajicdalibor"

  echo "Git commit release '${VERSION}'"
  git add client/package.json client/package-lock.json
  git commit -m "[skip ci] release '${VERSION}'"
  git tag "${VERSION}"

  git push --set-upstream origin "$CIRCLE_BRANCH"
  git push origin --tags
  npm run version --prefix client
  echo "Releasing"
else
 echo "Skip releasing"
fi
