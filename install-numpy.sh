#!/bin/sh

# Based on: https://github.com/tprelog/iocage-homeassistant/issues/64
set -x

# numpy-v1.26.0: https://github.com/numpy/numpy/issues/24873#issuecomment-1753093585
echo "[i] numpy v1.26.0 for google-cloud-texttospeech"
git -C /root clone https://github.com/numpy/numpy.git
git -C /root/numpy checkout v1.26.0
git -C /root/numpy cherry-pick 040ed2d
git -C /root/numpy submodule update --init

/root/install-pip-package.sh /root/numpy

rm -f -R /root/numpy
