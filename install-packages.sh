#!/bin/sh

# Based on: https://github.com/tprelog/iocage-homeassistant/issues/64
echo "[i] Installing required packages for Home Assistant, python and python packages"

pkg install -y \
        autoconf \
        bash \
        ca_root_nss \
        cmake \
        curl \
        ffmpeg \
        gcc \
        git \
        gmake \
        mariadb1011-client \
        nasm \
        libjpeg-turbo \
        libxml2 \
        libxslt \
        openblas \
        pkgconf \
        rust \
        sqlite3 \
        wget \
        zip \
        zlib-ng \
        zoneinfo

# Ensure .pkgsave files are not intepreted as zoneinfo
find /usr/share/zoneinfo -name "*.pkgsave" -delete
