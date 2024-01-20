#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${0}")

source "${SCRIPT_DIR}"/set_vars.sh

# Public: Builds the CLI tool to build/dac.
#
# $1 - [optional] a version to inject, otherwise the version from the VERSION file is read.
#
# Examples
#
#   ./bin/build.sh # reads the version in the VERSION file
#   ./bin/build.sh "1.2.3"
#
# Returns exit code 0.
function main() {
  local version

  set_vars

  version=$(<VERSION)

  # If the version argument exists, use it.
  if [ -n "$1" ]; then
    version="$1"
  fi

  printf "%b Compiling binary...\n" "${INFO_PREFIX}"
  go build -o "${BUILD_PATH}"/dac -ldflags "-X main.Version=$version" cmd/dac/main.go


  printf "%b Done!\n" "${INFO_PREFIX}"
}

# And so, it begins...
main "$1"
