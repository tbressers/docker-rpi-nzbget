FROM hypriot/rpi-alpine

ARG nzbget_version

# Install nzbget
RUN apk add --update wget \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /volumes/config /volumes/downloads /opt/nzbget /setup \
    && cd /setup \
    && wget https://github.com/nzbget/nzbget/releases/download/v$nzbget_version/nzbget-$nzbget_version-bin-linux.run
    && sh nzbget-latest-bin-linux.run --arch armel --destdir /opt/nzbget \
    && apk del wget \
    && cd  \
    && rm -r /setup \
    && touch /opt/init.sh \
    && echo 'if [ ! -f "/volumes/config/nzbget.conf" ]; then cp /opt/nzbget/nzbget.conf /volumes/config/nzbget.conf; fi' >> /opt/init.sh \
    && echo './opt/nzbget/nzbget -s -o OutputMode=log -c /volumes/config/nzbget.conf' >> /opt/init.sh

# Volume mappings
VOLUME /volumes/config /volumes/downloads

# Exposes nzbget's default port
EXPOSE 6789

# Start nzbget in server and log mode
ENTRYPOINT ["sh", "/opt/init.sh"]
