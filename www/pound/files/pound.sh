#!/bin/sh

if ! PREFIX=$(expr $0 : "\(/.*\)/etc/rc\.d/$(basename $0)\$"); then
    echo "$0: Cannot determine the PREFIX" >&2
    exit 1
fi

case "$1" in
	start)
	if [ -x ${PREFIX}/sbin/pound ]; then
		${PREFIX}/sbin/pound &
		echo -n ' pound'
	fi
	;;
	stop)
		killall pound
		echo -n ' pound'
	;;
	*)
	echo "Usage: `basename $0` {start|stop}" >&2
	;;
esac
