#!/bin/bash

API_KEY="eb12a295d37a734826b7c60ee578fd89"  # OpenWeatherAPI
CITY="Copenhagen"                           # or city ID, e.g., 2618425
UNITS="metric"                              # metric, imperial, or standard

data=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}&units=${UNITS}")

if [ -n "$data" ]; then
    temp=$(echo "$data" | jq '.main.temp' | cut -d"." -f1)
    icon=$(echo "$data" | jq -r '.weather[0].icon')

    # Map OpenWeatherMap icons to simple symbols (optional)
    case $icon in
        01d|01n) weather="󰖙" ;; # Clear
        02d|02n) weather="󰖕" ;;
        03d|03n|04d|04n) weather="󰖐" ;;
        09d|09n|10d|10n) weather="󰖖" ;;
        11d|11n) weather="󰖓" ;;
        13d|13n) weather="❄" ;;
        50d|50n) weather="󰖑" ;;
        *) weather="?" ;;
    esac

    echo "{\"text\": \"${temp}°C ${weather}\", \"tooltip\": \"${CITY}\"}"
else
    echo "{\"text\": \"N/A\", \"tooltip\": \"No data\"}"
fi
