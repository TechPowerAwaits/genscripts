#! /bin/sh

# Copyright 2021 Richard Johnston <techpowerawaits@outlook.com>
# SPDX-license-identifer: GPL-2.0-only

if [ "$1" = "start" ]; then
	touch /var/tmp/gen-working
elif [ "$1" = "stop" ]; then
	rm /var/tmp/gen-working
else
	echo 'Please specify "start" or "stop" as an argument.'
	exit 1
fi
echo "Done."
exit 0
