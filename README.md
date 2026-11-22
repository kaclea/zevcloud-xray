# zevcloud-xray

Deploy Xray (VLESS + WebSocket) on ZevCloud from a Dockerfile.

ZevCloud uses the `Dockerfile` in the repository root as-is. The container
listens on `0.0.0.0:$PORT` (`$PORT` is set by ZevCloud).

## Required environment variables (set as secrets in ZevCloud → Variables)

- `UUID` — the VLESS client UUID
- `WS_PATH` — the WebSocket path, e.g. `/zv-abc123`

`entrypoint.sh` renders `config.template.json` with these values at container
start and runs `xray run -c /app/config.json`.

## Client

`vless://<UUID>@<your-app>.zevcloud.app:443?encryption=none&security=tls&type=ws&host=<your-app>.zevcloud.app&path=<WS_PATH, URL-encoded>`
