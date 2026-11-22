#!/bin/sh
set -e
: "${UUID:?UUID env var is required}"
: "${WS_PATH:?WS_PATH env var is required}"
PORT="${PORT:-8000}"
sed -e "s|__PORT__|${PORT}|g" -e "s|__UUID__|${UUID}|g" -e "s|__WS_PATH__|${WS_PATH}|g" /app/config.template.json > /app/config.json
exec /app/xray run -c /app/config.json
