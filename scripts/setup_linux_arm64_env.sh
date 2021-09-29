#!/bin/bash

apt update && apt install -y python3 python3-pip python3-dev build-essential git wget xz-utils ninja-build meson flex bison
wget --no-check-certificate https://nodejs.org/download/release/v14.17.0/node-v14.17.0-linux-arm64.tar.xz
tar xvJf node-v14.17.0-linux-arm64.tar.xz
rm node-v14.17.0-linux-arm64.tar.xz
export PATH="/node-v14.17.0-linux-arm64/bin:${PATH}"

