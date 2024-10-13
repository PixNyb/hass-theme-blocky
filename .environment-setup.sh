#!/bin/bash

# Install Home Assistant Core dependencies
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y \
    python3 \
    python3-dev \
    python3-venv \
    python3-pip \
    bluez \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev \
    autoconf \
    build-essential \
    libopenjp2-7 \
    libtiff6 \
    libturbojpeg0-dev \
    tzdata \
    ffmpeg \
    liblapack3 \
    liblapack-dev \
    libatlas-base-dev

(
    # Create the Home Assistant Core user
    sudo useradd -rm homeassistant

    # Create the Home Assistant Core virtual environment
    sudo mkdir /srv/homeassistant
    sudo chown homeassistant:homeassistant /srv/homeassistant

    sudo -u homeassistant -H -s <<'EOF'
    cd /srv/homeassistant
    python3 -m venv .
    source bin/activate

    # Install wheel and Home Assistant Core
    python3 -m pip install wheel
    pip3 install homeassistant==2024.10.2

    hass &

    EOF
)