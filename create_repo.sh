#!/usr/bin/env bash

set -euo pipefail

###


_log() {
  echo -e "\e[32m$1\e[0m"
}

_usage_guide() {
  _log "USAGE: ./$(basename $0) /home/path/to/destination"
}

_get_source_dir() {
  echo "$(realpath ${BASH_SOURCE[0]} | xargs dirname)"
}

_get_trimmed() {
  echo $(echo $1 | xargs)
}


###


copy_files() {
  local source="$(_get_source_dir)"
  local destination="$1"
  _log "START: copy $source to $destination"

  _log "STEP: creating if required - $destination"
  mkdir -p $destination

  _log "STEP: copying..."
  rsync -vr \
	  --exclude='.devbox' \
	  --exclude='.git' \
	  --exclude='create_repo.sh' \
	  --exclude='README.md' \
	  --exclude='CHANGELOG.md' \
	  $source/ \
	  $destination

  _log "END: copying complete"
}


###


main() {
  local destination=$(_get_trimmed "$1")

  if [[ -z $destination ]]; then
    echo -e "\e[31mERROR\e[0m: missing destination"
    _usage_guide
    exit 1
  fi

  copy_files $destination
}


###


main "${1-}"

