#!/usr/bin/env bash

LOGLEVEL=${LOGLEVEL:-0}
DEBUG_LEVEL=${DEBUG_LEVEL:-10}

function main() {
  log_debug "main"

  . src/moduleA.sh
  moduleA::main "$@"
}

function log_debug() {
  local message=$1
  [[ $LOGLEVEL -ge $DEBUG_LEVEL ]] && echo "DEBUG: $message"
}

main "$@"