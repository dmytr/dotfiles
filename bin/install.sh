#!/bin/bash -e

BASE="$(dirname $0)"
cd $BASE/..

#
# Helpers
#

do_init() {
    git submodule init
    git submodule update --init --recursive
}

do_venv() {
    python3 -m venv .env
    . .env/bin/activate
    pip install -U pip wheel ansible selinux
}

do_install() {
    echo "We would need a super-user permissions for this..."
    sudo echo "OK"

    ansible-playbook -i "localhost," -c local -v machine.yaml \
                     -e "ansible_python_interpreter=\"/usr/bin/env python3\""
}

#
# Install all the things
#

do_init
do_venv
do_install
