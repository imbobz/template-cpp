#!/bin/bash
set -e

wget https://github.com/gitleaks/gitleaks/releases/download/v8.30.1/gitleaks_8.30.1_linux_x64.tar.gz
tar -xf gitleaks_8.30.1_linux_x64.tar.gz
sudo mv gitleaks /usr/local/bin/
