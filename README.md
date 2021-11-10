# What is this?
A zigbee coordinator smart home bundle including:
* zigbee2mqtt at `8080`
* mqtt at `1883`,`9001`
## smart home control
* homeassistant at `8123`
* nodeRed at `1880`
## monitoring, visualization
* grafana at `3000`
* prometheus at `9090`
* mqtt-exporter, node-exporter

# Prerequisites
* `docker-ce`
* `docker-compose`
* faith

# How to setup
1. adjust the name of the coordinator serial port in `docker-compose.yml`
2. adjust `MQTT_USER` and `MQTT_PW` in initialize.bash
3. run `initialize.bash`
4. nodeRed, install `node-red-contrib-tasmota` and `node-red-contrib-zigbee2mqtt` in settings->palette
5. if you want to use nodeRed's zigbee2mqtt plugin, you have to enable the legacy-api in `configuration.yml`
