#!/bin/bash -e

#
# Helpers
#

do_init() {
    git submodule init
    git submodule update
}

do_install() {
    echo "We would need a super-user permissions for this..."
    sudo echo "OK"

    ansible-playbook -i "localhost," -c local -v machine.yml
}

#
# Install all the things
#

do_init
do_install
