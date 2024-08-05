#!/bin/sh

# Based on: https://github.com/tprelog/iocage-homeassistant/issues/64
set -x

# python-isal v1.6.1: https://github.com/pycompression/python-isal/pull/196
echo "[i] isal"
git -C /root clone --recurse-submodules --depth 1 --branch v1.6.1 https://github.com/pycompression/python-isal.git
curl --silent https://github.com/pycompression/python-isal/commit/244104405947a5e41f16926884bf84ac656de105.patch | git -C /root/python-isal apply

/root/install-pip-package.sh /root/python-isal

rm -f -R /root/python-isal
