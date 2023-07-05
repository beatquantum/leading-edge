#!/bin/bash

sudo apt update
sudo apt install rng-tools
sudo apt install haveged
sudo systemctl enable haveged
sudo cat /dev/random | rngtest -c 1000
