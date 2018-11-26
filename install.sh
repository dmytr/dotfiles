#!/bin/bash -e

#
# Helpers
#

do_init() {
    git submodule init
    git submodule update
}

do_venv() {
    python3 -m venv .env
    . .env/bin/activate
    pip install ansible
}

do_install() {
    echo "We would need a super-user permissions for this..."
    sudo echo "OK"

    ansible-playbook -i "localhost," -c local -v machine.yml \
                     -e "ansible_python_interpreter=\"/usr/bin/env python3\""
}

#
# Install all the things
#

do_init
do_venv
do_install
