#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${0}")

source "${SCRIPT_DIR}"/set_vars.sh

# Public: Packages the CLI tool and the contract code into a compressed zip file.
#
# Examples
#
#   ./bin/package.sh # reads the version in the VERSION file
#   ./bin/package.sh "1.2.3"
#
# Returns exit code 0 if successfully packaged, or exit code 1 if no build directory was found.
function main() {
  local file_name

  set_vars

  # check if the build directory exists
  if [ ! -d "${BUILD_DIR}" ]; then
    printf "%b no \"${BUILD_DIR}\" directory exists \n" "${ERROR_PREFIX}"

    exit 1
  fi

  if [ ! -d "${DIST_DIR}" ]; then
    printf "%b no \"${DIST_DIR}\" directory found, creating a new one \n" "${INFO_PREFIX}"

    mkdir -p "${DIST_DIR}"
  fi

  version=$(<VERSION)

  # if the version argument exists, use it
  if [ -n "$1" ]; then
    version="$1"
  fi

  file_name="dac-${version}.zip"

  # remove files (-f will suppress the error if the file does not exist)
  rm -f "${DIST_DIR}/${file_name}"

  # zip up build directory
  # shellcheck disable=SC2164
  (cd "${BUILD_DIR}"; zip -qr "${DIST_DIR}/${file_name}" ./*)

  printf "%b packaged build at \"${DIST_DIR}/${file_name}\" \n" "${INFO_PREFIX}"

  exit 0
}

# And so, it begins...
main "$1"
