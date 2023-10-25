#!/bin/bash
#Install PHP with Apache on Ubuntu
apt update && apt upgrade

apt install software-properties-common

add-apt-repository ppa:ondrej/php

apt update

apt -y install php8.1
