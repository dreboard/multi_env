#!/usr/bin/env bash

echo -e "\n------------------------------------------- Installing Apache\n"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y openssl

