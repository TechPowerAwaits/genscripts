#! /bin/sh

# Copyright 2021 Richard Johnston <techpowerawaits@outlook.com>
# SPDX-license-identifer: GPL-2.0-only

uname -a
date
echo
if [ -e /var/tmp/gen-working ]; then
        echo "An installation is in process."
        echo "Can't continue."
        echo "Done for now."
        exit 2
fi
if [ -e /var/tmp/gensync-"$(date --rfc-3339=date)" ]; then
        echo "emerge --sync has already been run on this date."
        echo "Done for now."
        exit 1
else
        if ! emerge --sync --quiet=y; then
                echo
                echo "emerge --sync failed."
                echo "Falling back to webrsync."
                echo
                if ! emerge-webrsync; then
                        echo
                        echo "webrsync failed."
                        echo "Done for now."
                        exit 1
                fi
        fi
        touch /var/tmp/"gensync-$(date --rfc-3339=date)"
        echo
        echo "Checking for new updates."
        echo
        emerge --pretend --verbose --nospinner --update --deep --with-bdeps=y --newuse @world
        echo
        echo "Checking for obsolete dependencies."
        emerge --pretend --nospinner --depclean
        echo
        echo "Reading news."
        eselect news read
        eselect news purge
        echo "Done for now."
        exit 0
fi
