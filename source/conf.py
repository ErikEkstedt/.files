import os
from os.path import join, exists
from pathlib import Path
import platform
import numpy as np



class Config(object):
    """Docstring for OSConfig.
    Config or OSFeatures:
        ~/blog/notes/programming/os-features.md

    Keyboard:   keys and mappings
    Screen:     tiles/movents
    Terminal:   programs, configs, colors, responsiveness
        """

    def __init__(self):
        """TODO: to be defined1. """
        self.os = self._os()  # get system and username
        self.features = self._features()  # wants
        self.terminal = self._terminal()  # wants
        self.implemented = self._implemented()  # wants implemented in real configs
        self.keyVariables = self._keyVariables()  # Keys
        self.dotfilePath = join(Path.home(), '.files')


    def _os(self):
        return {'system': platform.system(),
                'node': platform.node(),
                'release': platform.release(),
                'version': platform.version(),
                'machine': platform.machine(),
                'processor': platform.processor()}

    def _keyVariables(self):
        # self.keyVariables['key']['Ctrl']
        return {'name': 'keyVariables',
                'key': ['Alt',
                        'Cmd',
                        'Win',
                        'option',
                        'Ctrl',
                        'Shift',
                        'Space',
                        'Tab',
                        'fn', ],
                'pc': ['Ctrl',
                       'fn',
                       'Win',
                       'Alt',
                       'Space',
                       'altGr',
                       'menu',
                       'Ctrl',],
                'macos': ['fn',
                          'Ctrl',
                          'option',
                          'Cmd',
                          'Space',
                          'Cmd',
                          'option']
                }

    def _features(self):
        return {'name': 'featuresDict',
                'altTab': ['Press [w] + tab '],
                'move between desktops:': [''] }

    def _implemented(self):
        return {'os': ['kde', 'macos'], 'implemented': np.zeros((2, len(self.features)))}

    def _terminal(self):
        return {'name': 'terminalFeatures',
                'app': ['konsole', 'iterm2',  'st'],
                'programs': ['Vim',
                             'Tmux',
                             'Fzf',
                             'Ranger',
                             'Zsh']}

    def __str__(self):
        def stringDict(d):
            string = ""
            for k, v in d.items():
                string += str(k) + ": " + str(v)
                string += "\n"
            return string

        s = "\n"
        s += "DotFile Path: " + self.dotfilePath + "\n"
        s += "-"*50
        s += "\nOS\n"
        s += stringDict(self.os)

        s += "-"*50
        s += "\nFeatures\n"
        s += stringDict(self.features)

        s += "-"*50
        s += "\nKeys\n"
        s += stringDict(self.keyVariables)

        s += "-"*50
        s += "\nTerminal\n"
        s += stringDict(self.terminal)
        s += "-"*50
        return s


def testConfig():
    config = Config()
    print(config)


if __name__ == '__main__':
    testConfig()
