FROM debian:stable-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /app
ADD https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip /tmp/xray.zip
RUN unzip -o /tmp/xray.zip xray -d /app && chmod +x /app/xray && rm /tmp/xray.zip
COPY entrypoint.sh /app/entrypoint.sh
COPY config.template.json /app/config.template.json
RUN chmod +x /app/entrypoint.sh
ENV PORT=8000
EXPOSE 8000
CMD ["/app/entrypoint.sh"]
