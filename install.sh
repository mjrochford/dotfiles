#!/usr/bin/env sh

guix home reconfigure -L src/guix "src/guix/$(hostname)-home-config.scm"
