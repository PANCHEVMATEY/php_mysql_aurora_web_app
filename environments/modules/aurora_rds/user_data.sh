#!/bin/bash
#Install PHP with Apache on Ubuntu
sudo apt update && sudo apt upgrade

sudo apt install software-properties-common

sudo add-apt-repository ppa:ondrej/php

sudo apt -y install php7.4

sudo php -v