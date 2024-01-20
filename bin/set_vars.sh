#!/usr/bin/env bash

# Public: Convenience function that exports some common environment variables.
function set_vars() {
  export APPLICATIONS_DIR="${PWD}/applications"
  export BUILD_DIR="${PWD}/.build"
  export DIST_DIR="${PWD}/dist"
  export ERROR_PREFIX='\033[0;31m[ERROR]\033[0m'
  export INFO_PREFIX='\033[1;33m[INFO]\033[0m'
}
