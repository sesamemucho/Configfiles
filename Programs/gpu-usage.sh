#!/bin/sh

gpustat | tail -1 | awk -F '|' '{print "Temp, Utilization: "$2; print "Memory:"$3}' | xargs -0 notify-send
