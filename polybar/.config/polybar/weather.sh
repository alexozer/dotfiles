#!/usr/bin/env bash

# shellcheck source=/home/alex/.config/polybar/secrets.sh
. ~/.config/polybar/secrets.sh

# Config
UNITS="imperial"
SYMBOL="°"
# End config

LOC_URL='https://location.services.mozilla.com/v1/geolocate?key=geoclue'

if ! location_json="$(curl -sf "$LOC_URL")"; then
	exit
fi

lat="$(echo "$location_json" | jq '.location.lat')"
lon="$(echo "$location_json" | jq '.location.lng')"

weather_url="http://api.openweathermap.org/data/2.5/weather?appid=$OPENWEATHERMAP_KEY&lat=$lat&lon=$lon&units=$UNITS"

# Don't update output if weather fetch fails
if ! weather="$(curl -sf "$weather_url")"; then
	exit
fi

weather_desc="$(echo "$weather" | jq -r '.weather[0].description')"
weather_desc="${weather_desc^}" # Capitalize
weather_temp="$(echo "$weather" | jq '.main.temp + 0.5 | floor')"

echo "$weather_desc $weather_temp$SYMBOL"
