#!/bin/sh

pulsemixer --list-sinks | grep plexamp | awk '{print $4}' | sed 's/,/ /g' | xargs pulsemixer --change-volume -10 --id
