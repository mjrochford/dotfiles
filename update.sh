#!/usr/bin/env sh

guix system describe
[ $? -eq 0 ] && sudo ./make-system.scm
