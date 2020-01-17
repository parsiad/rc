#!/bin/bash

sudo rfkill unblock wifi
sleep 1
sudo create_ap wlp6s5 enp2s0 hal9000 aabcdgin
