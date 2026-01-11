#!/bin/bash

# ----------------------------------------------------
#
#   P O L Y B A R  -  W E A T H E R   M O D U L E
# 
# ----------------------------------------------------
#
#   This script fetches weather forecast via the
#   openweatherapi. Replace api key with personal 
#   api-key to work.
#
# ----------------------------------------------------

set -euo pipefail

API_KEY="$(< ~/Source/api-keys/openweather-api.key)"

CITY="Copenhagen"       # city, e.g. "Copenhagen"
UNITS="metric"
LANG="en"

# Colors (match your polybar theme)
TEXT_COLOR="#a5adcb"
SEP_COLOR="#8aadf4"
CITY_ICON_COLOR="#91d7e3"

CLR_SUN="#eed49f"
CLR_MOON="#f4dbd6"
CLR_CLOUD_SUN="#eed49f"
CLR_CLOUD="#cad3f5"
CLR_RAIN="#7dc4e4"
CLR_THUNDER="#c6a0f6"
CLR_SNOW="#cad3f5"
CLR_MIST="#939ab7"
CLR_DEFAULT="#a5adcb"

# -------------------- HELPERS -----------------------

icon_map() {
  case "$1" in
    01d) echo "󰖙|$CLR_SUN" ;;                    # clear day
    01n) echo "󰖔|$CLR_MOON" ;;                   # clear night
    02d|02n) echo "󰖕|$CLR_CLOUD_SUN" ;;              # few clouds
    03d|03n|04d|04n) echo "󰖐|$CLR_CLOUD" ;;      # clouds
    09d|09n|10d|10n) echo "󰖗|$CLR_RAIN" ;;       # rain
    11d|11n) echo "󰖓|$CLR_THUNDER" ;;            # thunder
    13d|13n) echo "󰖘|$CLR_SNOW" ;;               # snow
    50d|50n) echo "󰖑|$CLR_MIST" ;;               # mist
    *) echo "󰖐|$CLR_DEFAULT" ;;
  esac
}

poly_icon() {
  local code="$1"
  local out icon color
  out="$(icon_map "$code")"
  icon="${out%%|*}"
  color="${out##*|}"
  printf "%%{F%s}%s%%{F-}" "$color" "$icon"
}

poly_text() {
  printf "%%{F%s}%s%%{F-}" "$TEXT_COLOR" "$1"
}

poly_sep() {
  local sep="$1"
  printf "%%{F%s}%s%%{F-}" "$SEP_COLOR" "$sep"
}

poly_color_icon() {
  local icon="$1"
  local color="$2"
  printf "%%{F%s}%s%%{F-}" "$color" "$icon"
}

wind_dir() {
  local deg="${1:-0}"
  local dirs=(N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW)
  local idx=$(( ((deg + 11) % 360) / 22 ))
  echo "${dirs[$idx]}"
}

wind_arrow() {
  local deg="${1:-0}"
  local arrows=(↑ ↗ → ↘ ↓ ↙ ← ↖)
  local idx=$(( ((deg + 22) % 360) / 45 ))
  echo "${arrows[$idx]}"
}

# -------------------- VALIDATION --------------------

if [[ -z "${API_KEY}" || "${API_KEY}" == "PUT_YOUR_KEY_HERE" ]]; then
  echo "$(poly_text "N/A")"
  exit 1
fi

# --------------------- API CALL ---------------------

NOW_JSON="$(curl -sf "https://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}&units=${UNITS}&lang=${LANG}")" || {
  echo "$(poly_text "N/A")"
  exit 1
}

# -------------------- PARSE JSON --------------------

NOW_TEMP="$(echo "$NOW_JSON" | jq -r '.main.temp | round')"
NOW_ICON_CODE="$(echo "$NOW_JSON" | jq -r '.weather[0].icon')"

WIND_SPEED="$(echo "$NOW_JSON" | jq -r '.wind.speed // 0')"
WIND_DEG="$(echo "$NOW_JSON" | jq -r '.wind.deg // 0')"
WIND_ARR="$(wind_arrow "$WIND_DEG")"
# WIND_COMPASS="$(wind_dir "$WIND_DEG")"  # enable if you want N/NE/E too

# ---------------------- OUTPUT ----------------------

# CITY_ICON_FMT="$(poly_color_icon "" "$CITY_ICON_COLOR")"
NOW_ICON_FMT="$(poly_icon "$NOW_ICON_CODE")"
WIND_ICON="󰖝"

# echo "${CITY_ICON_FMT} $(poly_text "${CITY}")  ${NOW_ICON_FMT}  $(poly_text "${NOW_TEMP}°C")  $(poly_sep "$WIND_ICON")  $(poly_text "${WIND_SPEED} m/s ${WIND_ARR}")"
echo "${NOW_ICON_FMT}  $(poly_text "${NOW_TEMP}°C")  $(poly_sep "$WIND_ICON")  $(poly_text "${WIND_SPEED} m/s ${WIND_ARR}")"
