#!/usr/bin/env python3

import time
import os
import subprocess


class ShellError(Exception):
    def __init__(self, msg):
        self.msg = msg


def sh(cmd, check=True, stdin_str=None):
    proc = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    stdout, stderr = proc.communicate(stdin_str)
    if check and proc.returncode != 0:
        msg = (
            f'Failed to run command: {proc.args}\n'
            f'Return code: {proc.returncode}\n\n'
            f'Stdout:\n{stdout}\n'
            f'Stderr:\n{stderr}'
        )
        raise ShellError(msg)
    return stdout


def cd(path):
    os.chdir(os.path.expanduser(path))
