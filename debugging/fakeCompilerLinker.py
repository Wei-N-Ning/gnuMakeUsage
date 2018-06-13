"""
usage:

create an executable wrapping the fake compiler or fake linker

e.g.
import fakeCompilerLinker
compiler = fakeCompilerLinker.FakeCompiler('cxxfake', '/tmp/cxxfake.log')
compiler.compile()

then pass the executable path to make

make CC=... CXX=... NVCC=... LD=...
"""

from __future__ import print_function

import logging
import sys


class _Logger(object):

    def __init__(self, logger_name, log_path):
        self.logger_name = logger_name
        self.log_path = log_path

    def formatter(self):
        return logging.Formatter('%(asctime)s || {} || %(message)s'.format(self.logger_name))

    def log_args(self):
        logger = logging.getLogger(self.logger_name)
        handler = logging.FileHandler(self.log_path)
        formatter = self.formatter()
        handler.setFormatter(formatter)
        logger.addHandler(handler)
        logger.setLevel(logging.INFO)
        logger.info(' '.join(sys.argv[1:]))


class FakeCompiler(object):

    def __init__(self, logger_name, log_path, contents='fake', dep_contents=''):
        self.out_path = ''
        self.dep_path = ''
        self.to_link = False
        self.logger = _Logger(logger_name, log_path)
        self.contents = contents
        self.dep_contents = dep_contents

    def compile(self):
        for idx, _ in enumerate(sys.argv):
            if _ == '-o':
                self.out_path = sys.argv[idx + 1].split(',')[-1]
            elif _.endswith('.d'):
                self.dep_path = _.split(',')[-1]
            elif '-Wl' in _ or _.startswith('-L') or _.startswith('-l'):
                self.to_link = True
        assert self.out_path, 'missing output path'
        with open(self.out_path, 'wb') as fp:
            fp.write(self.contents)
        if self.dep_path:
            with open(self.dep_path, 'w') as fp:
                fp.write(self.dep_contents)
        self.logger.log_args()


class FakeLinker(object):

    def __init__(self, logger_name, log_file, contents='fake'):
        self.logger = _Logger(logger_name, log_file)
        self.contents = contents
        self.out_path = ''

    def link(self):
        for idx, _ in enumerate(sys.argv):
            if _ == '-o':
                self.out_path = sys.argv[idx + 1].split(',')[-1]
        assert self.out_path, 'missing output path'
        with open(self.out_path, 'wb') as fp:
            fp.write(self.contents)
        self.logger.log_args()


class GetIncludeDirs(object):
    """
    example of excludes: 
    /vol/bob/check, /vol/bob/built/linux64/L48/dev/koru/work
    """
    def __init__(self, file_path, prefixes_to_exclude=None):
        self.file_path = file_path
        self._paths = set()
        self._prefixes_to_exclude = prefixes_to_exclude or list()
    
    def _to_exclude(self, path):
        for px in self._prefixes_to_exclude:
            if path.startswith(px):
                return True
        return False

    def _do(self, path):
        if path in self._paths:
            return
        if self._to_exclude(path):
            return
        self._paths.add(path)

    def do(self):
        with open(self.file_path, 'r') as fp:
            for each_line in fp:
                for arg in each_line.split(' '):
                    if arg.startswith('-I'):
                        self._do(arg[2:])
        return list(self._paths)


class GetDFlags(object):
    
    def __init__(self, file_path):
        self.file_path = file_path
        self._flags = set()

    def _do(self, flag):
        key, value = (flag.split('=') + [''])[0:2]
        if value:
            if len(value) > 20:
                return
            elif value.count('"') == 1:
                value = "'{}'".format(value.replace('"', ''))
            elif value.count('"') == 2:
                value = value.replace('"', '\'')
            elif not value.isdigit():
                value = '\'{}\''.format(value)
            flag = '"{}={}"'.format(key, value)
        else:
            flag = '"{}"'.format(key)
        if flag in self._flags:
            return
        self._flags.add(flag)

    def do(self):
        with open(self.file_path, 'r') as fp:
            for each_line in fp:
                for arg in each_line.split(' '):
                    if arg.startswith('-D'):
                        self._do(arg[2:])
        return list(self._flags)







