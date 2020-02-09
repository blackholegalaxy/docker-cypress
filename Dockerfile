FROM node:10

LABEL maintainer="blackholegalaxy"

ARG CYPRESS_VERSION=3.8.3

ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
ENV CI=1
RUN npm config -g set user $(whoami)
RUN echo "user: $(whoami)"

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list \
  && apt-get -qqy update \
  && apt-get -qqy install \
    google-chrome-stable \
    ca-certificates \
    apt-transport-https \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb \
    zip \
  && rm -rf /var/lib/apt/lists/*
  
RUN yarn global add cypress@$CYPRESS_VERSION
RUN cypress verify

# Cypress cache and installed version
RUN cypress cache path
RUN cypress cache list
  
ADD scripts/wait-on-ping.sh /etc/openvpn/wait-on-ping.sh

RUN chmod +x /etc/openvpn/wait-on-ping.sh
