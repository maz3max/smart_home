#!/bin/bash

MQTT_USER=test
MQTT_PW=very-secure-password

sudo chown $USER -R *

docker run -it eclipse-mosquitto:2.0.13 sh -c "mosquitto_passwd -c -b passwd $MQTT_USER $MQTT_PW && cat passwd && rm passwd" > mosquitto/config/passwd
sed -i "s/user:.*/user: $MQTT_USER/" zigbee2mqtt/configuration.yaml
sed -i "s/password:.*/password: $MQTT_PW/" zigbee2mqtt/configuration.yaml
sed -i "s/MQTT_USERNAME=.*/MQTT_USERNAME=$MQTT_USER/" docker-compose.yml
sed -i "s/MQTT_PASSWORD=.*/MQTT_PASSWORD=$MQTT_PW/" docker-compose.yml

mkdir nodered
mkdir homeassistant

mkdir -p grafana/storage
mkdir -p grafana/provisioning
mkdir -p grafana/log
sudo chown -R 472 grafana/

mkdir -p prometheus/storage
sudo chown -R 65534 prometheus/
