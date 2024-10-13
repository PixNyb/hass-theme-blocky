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
    # Create the Home Assistant Core virtual environment
    sudo mkdir /srv/hass
    sudo chown $USER:$USER /srv/hass

    cd /srv/hass
    python3 -m venv .
    source bin/activate

    # Install wheel and Home Assistant Core
    python3 -m pip install wheel
    pip3 install homeassistant==2024.10.2

    hass > /dev/null 2>&1 &
    HASS_PID=$!

    # Wait for Home Assistant to start by checking http://localhost:8123
    while ! curl -s -f http://localhost:8123 &>/dev/null; do
        sleep 1
    done

    # Stop Home Assistant
    kill $HASS_PID

    # Add the following to the configuration.yaml file
    echo "demo:" >> ~/.homeassistant/configuration.yaml
    echo "http:" >> ~/.homeassistant/configuration.yaml
    echo "  use_x_forwarded_for: true" >> ~/.homeassistant/configuration.yaml
    echo "  trusted_proxies:" >> ~/.homeassistant/configuration.yaml
    echo "    - 127.0.0.1" >> ~/.homeassistant/configuration.yaml
    echo "    - ::1" >> ~/.homeassistant/configuration.yaml
    echo "    - 172.0.0.0/8" >> ~/.homeassistant/configuration.yaml
    echo "    - 10.0.0.0/16" >> ~/.homeassistant/configuration.yaml
    echo "    - 192.168.0.0/16" >> ~/.homeassistant/configuration.yaml

    # Install the Home Assistant Community Store (HACS)
    curl -sfSL https://hacs.xyz/install | bash -

    # Create a link from the $PROJECT_FOLDER/themes folder to the ~/.homeassistant/themes/project folder
    ln -s $PROJECT_FOLDER/themes ~/.homeassistant/themes

    # Start Home Assistant
    hass > ~/.homeassistant/hass.log 2>&1 &
)