#!/bin/bash
# vim: softtabstop=2 shiftwidth=2 expandtab

check() {
  # Do not include this module by default; it must be requested
  return 255
}

install() {
  local _source _dest _require _instance _config

  _instance="$( dirname "${BASH_SOURCE[0]}" )"
  dinfo "Module path: ${_instance}"
  _config="/etc/default/$( basename "${_instance}" )"

  [ -e "${_config}" ] || return 
  dinfo "Reading configuration from ${_config}"

  while IFS=, read -r _require _source _dest; do
    [ -z "${_dest}" ] && _dest="${_source}"
    echo "Trying to install ${_source} to ${_dest}"

    if ! inst_simple "${_source}" "${_dest}" && [ "${_require}" == "req" ] ; then
      dfatal "Unable to install required file: ${_source}"
    fi
  done < "${_config}"
}
