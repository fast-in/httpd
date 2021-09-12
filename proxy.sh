#!/bin/sh -e

if [ $# != 3 ]; then
    echo 1>&2 "Usage: ${0##*/} <src-port> <dts-host> <dst-port>"
    exit 1
fi

TEMP=`mktemp -d "${TMPDIR-/tmp}/XXXsprx.y" 2>/dev/null`

back="$TEMP/pipe${RANDOM}.back"
send="$TEMP/pipe${RANDOM}.send"
recv="$TEMP/pipe${RANDOM}.recv"

trap 'rm -rf "$TEMP"' EXIT 0
mkfifo -m 0644 "$back" "$send" "$recv"

#use pipe
sed 's/^/> /' < "$send" &
sed 's/^/< /' < "$recv" &

netcat -lvp $1 < "$back" \
|tee "$send" \
|nc  $2 $3 \
|tee "$recv" > "$back"
