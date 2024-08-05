#!/bin/sh

# Based on: https://github.com/tprelog/iocage-homeassistant/issues/64

# Python version to install
PYTHON_RELEASE=$(curl --silent --compressed https://www.python.org/downloads/source/ | sed -nr 's/^.*Latest Python.*([0-9]+.[0-9]+.[0-9]+).*$/\1/p')

echo "[i] Installing Python: ${PYTHON_RELEASE}"

fetch -o - https://www.python.org/ftp/python/${PYTHON_RELEASE}/Python-${PYTHON_RELEASE}.tar.xz | tar -C /root -xJ
cd /root/Python-${PYTHON_RELEASE}/
./configure --disable-test-modules --enable-optimizations
make -j $(($(nproc) + 1))
make altinstall
rm -f -R /root/Python-${PYTHON_RELEASE}
