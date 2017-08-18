#!/usr/bin/env bash

echo -e "\n------------------------------------------- Installing Extras\n"
sudo apt-get -y install curl git nano tofrodos
sudo apt-get install snmp
sudo apt-get -y autoremove

