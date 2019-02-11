#!/user/bin/env python2
from subprocess import check_output

def decrypt(path):
    return check_output("gpg -dq " + path, shell=True).strip("\n")

def pass_show(identifier):
    return check_output("pass show " + identifier, shell=True).strip("\n")
