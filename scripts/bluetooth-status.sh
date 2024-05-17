#!/bin/bash

systemctl is-active --quiet bluetooth.service && echo "󰂯" || echo "󰂲"
