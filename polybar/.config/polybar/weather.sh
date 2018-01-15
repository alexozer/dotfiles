#!/usr/bin/env bash

. ~/.config/polybar/secrets.sh

CITY="5122432" # Ithaca
# CITY="5211420" # Sellersville
# CITY="5505321" # Hawthorne
UNITS="imperial"
SYMBOL="°F"

url="http://api.openweathermap.org/data/2.5/weather?APPID=$OPENWEATHERMAP_KEY&id=$CITY&units=$UNITS"

# Don't update output if weather fetch fails
if weather="$(curl -sf "$url")"; then
	weather_desc=$(echo "$weather" | jq -r ".weather[].description")
	weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)

	echo "$weather_desc", "$weather_temp$SYMBOL"
fi
