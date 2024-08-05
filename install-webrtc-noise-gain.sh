#!/usr/local/bin/bash

# Based on: https://github.com/tprelog/iocage-homeassistant/issues/64
set -x

# webrtc-noise-gain: https://github.com/rhasspy/webrtc-noise-gain/issues/6#issuecomment-1836810982
echo "[i] webrtc-noise-gain"
git -C /root clone --recurse-submodules https://github.com/rhasspy/webrtc-noise-gain.git
git -C /root/webrtc-noise-gain reset --hard 32a1225

/root/install-pip-package.sh /root/webrtc-noise-gain

rm -f -R /root/webrtc-noise-gain
