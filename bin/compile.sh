#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${0}")

source "${SCRIPT_DIR}"/set_vars.sh

# Public: Compiles the PyTeal source files into TEAL source code.
#
# Examples:
#
#   ./bin/compile.sh
#
# Returns exit code 0.
function main {
  local application_dir
  local applications_dirs
  local application_filename
  local application_files
  local compiled_application_dir
  local compiled_filename

  set_vars

  # if the .build/ directory does not exist, create it
  if [[ ! -d "${BUILD_DIR}" ]]; then
    printf "%b creating %b directory... \n" "${INFO_PREFIX}" "${BUILD_DIR}"
    mkdir -p "${BUILD_DIR}"
  fi

  # remove the previous compiled applications directory
  rm -rf "${BUILD_DIR}/applications"

  application_dirs=$(ls -d "${APPLICATIONS_DIR}"/*/)

  # iterate through the application directories
  for application_dir in ${application_dirs}; do
    application_dir=$(basename -- "${application_dir}") # get the base directory
    application_files=$(ls -p "${APPLICATIONS_DIR}/${application_dir}" | grep -v /) # only get files

    for application_filename in ${application_files}; do
      compiled_filename="${application_filename%.py}.teal"
      compiled_application_dir="${BUILD_DIR}/applications/${application_dir}"

      # check if the directory exists, if not create it
      if [[ ! -d "${compiled_application_dir}" ]]; then
        printf "%b creating %b directory... \n" "${INFO_PREFIX}" "${compiled_application_dir}"
        mkdir -p "${compiled_application_dir}"
      fi

      # compile pyteal code to teal
      python3 "${APPLICATIONS_DIR}/${application_dir}/${application_filename}" >> "${compiled_application_dir}/${compiled_filename}"

      printf "%b compiled teal code to %b file... \n" "${INFO_PREFIX}" "${BUILD_DIR}/applications/${application_dir}/${compiled_filename}"
    done
  done

  exit 0
}

# And so, it begins...
main
