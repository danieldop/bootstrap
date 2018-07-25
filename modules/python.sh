#!/usr/bin/env bash

readonly PYTHON_2_VERSION='2.7.15'
readonly PYTHON_3_VERSION='3.7.0'

git clone git://github.com/yyuu/pyenv.git ~/.pyenv

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

pyenv install ${PYTHON_2_VERSION}
pyenv install ${PYTHON_3_VERSION}
pyenv local ${PYTHON_3_VERSION} && pip3 install --upgrade pip
pyenv local ${PYTHON_2_VERSION} && pip2 install --upgrade pip

tee -a ~/.bash_profile << END

# python
export PATH=$HOME/.pyenv/bin:\$PATH
eval "$(pyenv init -)"
END
