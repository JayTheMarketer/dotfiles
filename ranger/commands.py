# This is a custom commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command
# -----------------------------------------------------------------------------


class mkcd(Command):
    """
    :mkcd <dirname>

    Creates a directory with the name <dirname> and enters it.
    """

    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dirname = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(dirname):
            makedirs(dirname)

            match = re.search('^/|^~[^/]*/', dirname)
            if match:
                self.fm.cd(match.group(0))
                dirname = dirname[match.end(0):]

            for m in re.finditer('[^/]+', dirname):
                s = m.group(0)
                if s == '..' or (
                  s.startswith('.') and not self.fm.settings['show_hidden']):
                    self.fm.cd(s)
                else:
                    # We force ranger to load content before calling `scout`.
                    self.fm.thisdir.load_content(schedule=False)
                    self.fm.execute_console('scout -ae ^{}$'.format(s))
        else:
            self.fm.notify("file/directory exists!", bad=True)


class toggle_flat(Command):
    """
    :toggle_flat

    Flattens or unflattens the directory view.
    """

    def execute(self):
        if self.fm.thisdir.flat == 0:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = -1
            self.fm.thisdir.load_content()
        else:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = 0
            self.fm.thisdir.load_content()


class up(Command):
    """
    :up

    Quickly uploading a file to a server via scp.
    """
    def execute(self):
        if self.arg(1):
            scpcmd = ["scp", "-r"]
            scpcmd.extend(
              [f.realpath for f in self.fm.thistab.get_selection()])
            scpcmd.append(self.arg(1))
            self.fm.execute_command(scpcmd)
            self.fm.notify("Uploaded!")

    def tab(self):
        import os.path
        try:
            import paramiko
        except ImportError:
            """paramiko not installed"""
            return

        try:
            with open(os.path.expanduser("~/.ssh/config")) as file:
                paraconf = paramiko.SSHConfig()
                paraconf.parse(file)
        except IOError:
            """cant open ssh config"""
            return

        hosts = paraconf.get_hostnames()
        # remove any wildcard host settings since they're not real servers
        hosts.discard("*")
        return (self.start(1) + host + ":" for host in hosts)


class z(Command):
    """
    :z

    Jump to directory using z
    """
    def execute(self):
        import subprocess
        arg = self.rest(1)
        if arg:
            directory = subprocess.check_output(
              ["z"]+arg.split(), universal_newlines=True).strip()
            self.fm.cd(directory)


class show_files_in_finder(Command):
    """
    :show_files_in_finder

    Present selected files in finder
    """

    def execute(self):
        self.fm.run('open .', flags='f')
