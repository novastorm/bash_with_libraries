#!/usr/bin/env bash

LOGLEVEL=${LOGLEVEL:-0}
DEBUG_LEVEL=${DEBUG_LEVEL:-10}


function moduleA::parse_options() {
  log_debug $FUNCNAME

  while :; do
    case $1 in
      -h|-\?|--help)
        show_help
        exit
        ;;
      --option-a)
        _run_option_a=true
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
  moduleA::parse_options "$@"
  [[ "${_run_option_a}" == true ]] && moduleA::run_option_a
}

function moduleA::run_option_a() {
  log_debug $FUNCNAME
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  log_debug "${BASH_SOURCE[0]##*/}"
  moduleA::main "$@"
else
  log_debug "${0##*/} running ${BASH_SOURCE[0]##*/}"
fi
