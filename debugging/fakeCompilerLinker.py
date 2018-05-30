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
        if not self.to_link:
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
