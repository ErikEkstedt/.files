import numpy as np
import os
import platform



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
        self.implemented = self._implemented()  # wants implemented in real configs
        self.keyVariables = self._keyVariables()  # Keys

    def _os(self):
        return {'uname':platform.uname(),
                'system:':platform.system(),
                'node:':platform.node(),
                'release:':platform.release(),
                'version:':platform.version(),
                'machine:':platform.machine(),
                'processor:':platform.processor()}

    def _keyVariables(self):
        # self.keyVariables['key']['Ctrl']
        return {'name': 'keyVariables()',
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
        return {'os': ['kde', 'macos'], 'implemented': np.zeros(len(self.features))}

    def terminal(self):
        self.terminalFeatures = {'name': 'terminalFeatures()',
                                 'app': ['konsole', 'iterm2',  'st'],
                                 'programs': ['Vim',
                                              'Tmux',
                                              'Fzf',
                                              'Ranger',
                                              'Zsh']}

    def __str__(self):
        string = ""
        string+= str(self.os)
        return string



def testConfig():
    config = Config()
    print(config)


if __name__ == '__main__':
    testConfig()
