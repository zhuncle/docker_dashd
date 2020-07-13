#!/bin/bash
set -e

if [[ $(echo "$1" | cut -c1) = "-" ]]; then
  echo "$0: assuming arguments for dashd"

  set -- pivxd "$@"
fi

if [[ $(echo "$1" | cut -c1) = "-" ]] || [[ "$1" = "dashd" ]]; then
  mkdir -p "$DASH_DATA"
  chmod 700 "$DASH_DATA"

  echo "$0: setting data directory to $DASH_DATA"

  set -- "$@" -datadir="$DASH_DATA"
fi

if [[ "$1" = "dashd" ]] || [[ "$1" = "dash-cli" ]] || [[ "$1" = "dash-tx" ]]; then
  echo
  exec "$@"
fi

echo
exec "$@"
