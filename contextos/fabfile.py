# coding: utf-8
import sys
import os
import fnmatch
import compileall
import zipfile
import shutil
from importlib import import_module
from glob import glob

try:
    from configparser import RawConfigParser
except ImportError:
    from ConfigParser import RawConfigParser

from fabric.api import task, local, puts, prefix
from fabric.context_managers import shell_env, _setenv, settings
from fabric import state

ENV_NAME = 'colibri_python'
WORKON = r'workon {}'.format(ENV_NAME)

# A função original em fabric.context_managers  não suporta espaços no nome
def lcd(path):
    which = 'lcwd'
    if state.env.get(which) and not path.startswith('/') \
            and not path.startswith('~'):
        new_cwd = state.env.get(which) + '/' + path
    else:
        new_cwd = path
    return _setenv({which: new_cwd})


def obter_caminho(pasta=''):
    caminho = os.path.normpath(os.path.join(os.path.dirname(__file__), pasta))
    return caminho


def obter_parametros_delphi():
    return dict(
        dcc32="C:\\Program Files (x86)\\Embarcadero\\RAD Studio\\9.0\\bin\\dcc32.exe",
        delphi_lib='D:\\Vcl\\xe2bpl;D:\\Vcl\\xe2lib\\;D:\\Drive\\Vcl\\xe2bpl;D:\\Drive\\Vcl\\xe2lib\\;"C:\\Program Files (x86)\\Embarcadero\\RAD Studio\\9.0\\lib\\Win32\\release"',
        colibri_lib='D:\\Vcl\\co2lib\\;D:\\Builder\\plugins\\',
        unit_scope='System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;System;Xml;Data;Datasnap;Web;Soap;Winapi;Data.win;'
    )

def _setversion(versao, dll, plugin):
    with prefix(WORKON):
        local(
            'python -m setversion {exe} --version {versao} '
            '--fileversion {versao} --name "{name}"'.format(
                exe=dll,
                versao=versao,
                name='NCR Colibri Plugin {}'.format(plugin)
            )
        )

@task
def compilar_plugin_delphi(versao):
    path = obter_caminho('.')
    p = obter_parametros_delphi()
    p['pasta_dcu'] = '{path}\\dcu\\'.format(path=path)
    p['pasta_saida']= '{path}\\_build\\'.format(path=path)

    # cria a pasta dcu
    if not os.path.exists(p['pasta_dcu']):
        os.makedirs(p['pasta_dcu'])

    for prj in glob(path + '\\prj\\*.dpr'):
        with lcd(path + '\\prj'):
            p['projeto'] = prj
            # compila o projeto
            cmd = ' "{dcc32}" {projeto} -H -B -Q -U{delphi_lib};{colibri_lib} -N{pasta_dcu} -E{pasta_saida} -NS{unit_scope}'.format(**p)
            local(cmd)

    _setversion(
        versao,
        os.path.join(
            p['pasta_saida'], "plugin.contextos.col"
        ),
        'Contextos'
    )
