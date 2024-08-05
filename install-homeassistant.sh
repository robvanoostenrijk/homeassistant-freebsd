#!/usr/local/bin/bash

# Based on: https://github.com/tprelog/iocage-homeassistant/issues/64

export PYTHON_BIN=/usr/local/bin/python3.12

rm -f -R /usr/local/share/homeassistant
mkdir -p /usr/local/share/homeassistant

echo "[i] Installing Home Assistant"
cd /usr/local/share/homeassistant

${PYTHON_BIN} -m venv .
source bin/activate

set -x

pip install --upgrade pip
python -m pip install wheel
pip install homeassistant

# Optional Database drivers
pip install mysqlclient
#pip install psycopg2-binary
