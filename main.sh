#!/usr/bin/env bash

LOGLEVEL=${LOGLEVEL:-0}
DEBUG_LEVEL=${DEBUG_LEVEL:-10}

. src/utilities.lib.sh

function main() {
  log_debug "main"

  . src/moduleA.sh
  moduleA::main "$@"
  echo "$_run_option_pre_a"
}

main "$@"