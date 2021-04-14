#! /bin/sh

# Copyright 2021 Richard Johnston <techpowerawaits@outlook.com>
# SPDX-license-identifer: GPL-2.0-only

if [ -e /var/tmp/gen-working ]; then
	echo "Can't poweroff."
	echo "Install on progress."
	echo "Waiting for install to finish."
	echo
	while [ -e /var/tmp/gen-working ]; do
		sleep 1s
	done
fi

echo "Powering down in five minutes."
sleep 5m
poweroff
