#!/usr/bin/env bash

LOGLEVEL=${LOGLEVEL:-0}
DEBUG_LEVEL=${DEBUG_LEVEL:-10}

local _run_option_a
local _run_option_b

function moduleA::parse_options() {
  log_debug $FUNCNAME

  while :; do
    case $1 in
      -h|-\?|--help)
        moduleA::show_help
        exit
        ;;
      --option-a)
        _run_option_a=true
        ;;
      --option-pre-a)
        _run_option_pre_a=true
        ;;
      --)
        shift
        break
        ;;
      -?*)
        printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2  | tee -a $LOGFILE
        ;;
      *)
        break
    esac

    shift
  done
  [[ $LOGLEVEL -ge DEBUG_LEVEL ]] && echo "DEBUG: INTERACTIVE_MODE: [$INTERACTIVE_MODE]" | tee -a $LOGFILE
}

function moduleA::main() {
  log_debug $FUNCNAME
  if [[ $# -eq 0 ]]; then
    moduleA::run_interactively
  else
    moduleA::parse_options "$@"
    [[ "${_run_option_pre_a}" == true ]] && moduleA::run_option_pre_a
    [[ "${_run_option_a}" == true ]] && moduleA::run_option_a
  fi
}

function moduleA::run_option_pre_a() {
  log_debug $FUNCNAME
}

function moduleA::run_option_a() {
  log_debug $FUNCNAME
}

function moduleA::run_interactively() {
  log_debug $FUNCNAME
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  log_debug "${BASH_SOURCE[0]##*/}"
  moduleA::main "$@"
else
  log_debug "${0##*/} running ${BASH_SOURCE[0]##*/}"
fi
