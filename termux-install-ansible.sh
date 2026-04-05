#!/data/data/com.termux/files/usr/bin/bash
yes | pkg upgrade  && \
yes | pkg install \
  python \
  python-pip \
  libffi \
  openssl \
  libsodium  \
  clang \
  cmake \ 
# Add new dependencies 
  binutils
  rust
  build-essential

# Add flags
export CARGO_BUILD_TARGET=aarch64-linux-android
export RUSTFLAGS="-C lto=n"
# Setup Android API 
export ANDROID_API_LEVEL=29 # !!Write your API LEVEL"
# Install the latest Python package manager.
# The version of pip that comes with Python may be outdated.
pip install --upgrade pip 
pip list --outdated --format=freeze | \
  grep -v '^\-e' | \
  cut -d = -f 1 | \
  xargs -n1 pip install -U && \
# Upgrade depends 
pip install --upgrade pip setuptools wheel
pip install --upgrade pynacl  
pip install --upgrade cryptography ansible pywinrm[credssp]
