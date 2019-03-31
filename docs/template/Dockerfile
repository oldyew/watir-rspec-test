FROM ruby:2.3.1
LABEL description="Base container for Watir/Capybara tests against a local Chrome"
LABEL version="1.0.0"

# Install Chrome, Xvfb and utility packages (libav for video capture), clean up
RUN set -ex \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" \
        >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable libnss3 libgconf-2-4 \
        xvfb unzip libav-tools \
    && rm -rf /var/lib/apt/lists/*

# Install Chromedriver
RUN set -ex \
    && cd /tmp \
    && wget -Nv http://chromedriver.storage.googleapis.com/2.27/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && chmod -v +x chromedriver \
    && mv -v chromedriver /usr/local/bin/ \
    && rm -v chromedriver_linux64.zip
    
    CMD [ "ruby", "./run.rb" ]


# variant 2
from ruby

env CHROMEDRIVER_VERSION=2.42 \
  GECKODRIVER_VERSION=v0.21.0 \
  FIREFOX_VERSION=62.0.2

run \
  wget -q -O- https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable libappindicator1 fonts-liberation \
    xvfb unzip \
    libdbus-glib-1-2 && \
  gem install --no-ri --no-rdoc rspec watir watir-rspec headless && \
  wget -q http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
  unzip chromedriver_linux64.zip -d /usr/local/bin && \
  rm chromedriver_linux64.zip && \
  wget -q https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz -O- | tar xfz - -C /usr/local/bin && \
  wget -q https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 -O- | tar xfj - -C /opt && \
  ln -s /opt/firefox/firefox /usr/local/bin && \
  chmod +x /usr/local/bin/chromedriver /usr/local/bin/geckodriver

# variant 1
FROM ubuntu:16.04

RUN apt-get update -qqy && apt-get install -y curl xvfb chromium-browser firefox

RUN ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

RUN apt-get update -qqy \
  && apt-get -qqy install libnss3 libnss3-tools libfontconfig1 wget ca-certificates apt-transport-https inotify-tools \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*


RUN apt-get update -qqy && apt-get -y install ruby-full zlib1g-dev libffi-dev gcc make git

RUN apt-get autoclean

RUN gem install 'watir' --no-ri --no-rdoc
RUN gem install 'headless' --no-ri --no-rdoc
RUN gem install 'webdrivers' --no-ri --no-rdoc
RUN gem install 'watir-scroll' --no-ri --no-rdoc
RUN gem install 'rspec' --no-ri --no-rdoc
RUN gem install 'watir-rspec' --no-ri --no-rdoc
RUN gem install 'webdriver-highlighter' --no-ri --no-rdoc
RUN gem install 'colorize' --no-ri --no-rdoc
RUN gem install 'faraday' --no-ri --no-rdoc

ENV HEADLESS true

## emundo User
RUN addgroup --gid 1101 rancher && \
    # Für RancherOS brauchen wir diese Gruppe: http://rancher.com/docs/os/v1.1/en/system-services/custom-system-services/#creating-your-own-console
    addgroup --gid 999 aws && \
    # Für die AWS brauchen wir diese Gruppe
    useradd -ms /bin/bash emundo && \
    adduser emundo sudo && \
    # Das ist notwendig, damit das Image in RancherOS funktioniert
    usermod -aG 999 emundo && \
    # Das ist notwendig, damit das Image in RancherOS funktioniert
    usermod -aG 1101 emundo && \
    # Das ist notwendig, damit das Image lokal funktioniert
    usermod -aG root emundo

USER emundo
WORKDIR /home/emundo