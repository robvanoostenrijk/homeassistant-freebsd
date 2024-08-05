#!/usr/local/bin/bash

HOME=/usr/local/share/homeassistant
PYTHON_BIN=/usr/local/bin/python3.12

${PYTHON_BIN} -m venv ${HOME}
source ${HOME}/bin/activate

set -x
pip install $*
set +x
deactivate
