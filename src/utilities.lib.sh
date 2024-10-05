# Description: This file contains utility functions.

function log_debug() {
  local message=$1
  [[ $LOGLEVEL -ge $DEBUG_LEVEL ]] && echo "DEBUG: $message"
}
