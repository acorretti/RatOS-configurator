#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if echo "$SCRIPT_DIR" | grep -q "/src/"; then
	# in the deployment branch src is the root
  # noop when not in deployment
	exit
fi

source .env

if [ ! -f "$RATOS_CONFIGURATION_PATH/../printer.cfg" ]; then
  # first run, printer.cfg doesn't exist yet
  exit
fi

source $RATOS_CONFIGURATION_PATH/scripts/ratos-common.sh

replace_sbc_includes
