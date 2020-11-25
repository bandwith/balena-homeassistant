#!/bin/bash

cp /tmp/sense.yaml /config/sense.yaml
cp /tmp/sensors.sh /config/sensors.sh
cp /tmp/lovelace.sh /config/lovelace.sh

chmod +x /config/sensors.sh
chmod +x /config/lovelace.sh

if [ ! -f /config/ui-lovelace.yaml ]; then cp /tmp/ui-lovelace.yaml /config/ui-lovelace.yaml; fi 
if [ ! -d /config/custom_components/hacs ];
  then apk add wget unzip;
    wget https://github.com/hacs/integration/releases/latest/download/hacs.zip /tmp/hacs.zip;
    unzip /tmp/hacs.zip -d /config/custom_components/hacs;
    rm /tmp/hacs.zip;
fi
python -m homeassistant --config /config
