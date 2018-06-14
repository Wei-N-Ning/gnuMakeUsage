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
import os
import sys
import uuid
import shutil
import subprocess

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


class ObjGenerator(object):
    
    def __init__(self, compiler_exe, source_main=None, temp_dir='/tmp/dummysources'):
        if os.path.isdir(temp_dir):
            shutil.rmtree(temp_dir)
        os.mkdir(temp_dir)
        self.source_main = source_main if source_main else ['main.cc']
        self.p = temp_dir
        self.sources = list()
        self.out_type = ''
        self.compl = compiler_exe
    
    def generateDummySource(self, idx, is_main=False):
        u = str(uuid.uuid4()).replace('-', '')
        name = 'sub_{}'.format(u)
        path = os.path.join(self.p, '{}.cc'.format(u))
        if is_main:
            self.sources.append((idx, path, 'int main(int argc, char** argv) {return 0;}'))
        else:
            self.sources.append((idx, path, 'void {}(){{}}\n'.format(name)))
        
    def _is_main(self, path)
        for base_name in self.source_main:
            if path.endswith(base_name):
                return True
        return False

    def gen(self, file_path):
        out_file = ''
        for idx, _ in enumerate(sys.argv):
            if _.endswith('.cc') or _.endswith('.cu'):
                self.generateDummySource(idx, is_main=self._is_main(_))
                continue
            if _.startswith('-o'):
                out_file = sys.argv[idx + 1]
                self._analyse_out_file(out_file)
                continue
        assert out_file
        with open('/tmp/last', 'w') as fp:
            fp.write(str(sys.argv))

        for s in self.sources:
            idx, path, content = s
            with open(path, 'w') as fp:
                fp.write(content)
            sys.argv[idx] = path

        args = [self.compl] + sys.argv[1:]
        with open('/tmp/last', 'w') as fp:
            fp.write(str(args))

        assert 0 == subprocess.call(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        buf = ''
        with open(out_file, 'rb') as fp:
            buf = fp.read()
        with open(file_path, 'wb') as fp:
            fp.write(buf)


class TextGenerator(object):
    
    def __init__(self, text='fake'):
        self.text = text

    def gen(self, file_path):
        with open(file_path, 'wb') as fp:
            fp.write(self.text)


class FakeCompiler(object):

    def __init__(self, logger_name, log_path, generator=None, dep_contents=''):
        self.out_path = ''
        self.dep_path = ''
        self.to_link = False
        self.logger = _Logger(logger_name, log_path)
        self.generator = generator if generator else TextGenerator()
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
            self.generator.gen(fp)
        if self.dep_path:
            with open(self.dep_path, 'w') as fp:
                fp.write(self.dep_contents)
        self.logger.log_args()


class FakeLinker(object):

    def __init__(self, logger_name, log_file, generator=None):
        self.logger = _Logger(logger_name, log_file)
        self.generator = generator if generator else TextGenerator()
        self.out_path = ''

    def link(self):
        for idx, _ in enumerate(sys.argv):
            if _ == '-o':
                self.out_path = sys.argv[idx + 1].split(',')[-1]
        assert self.out_path, 'missing output path'
        with open(self.out_path, 'wb') as fp:
            self.generator.gen(fp)
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







