FROM ubuntu:22.04

# Set noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y wget bash curl ca-certificates nginx iproute2 ffmpeg zip unzip sudo make git lolcat figlet toilet \
    && apt-get install -y --no-install-recommends python3 python3-pip php gnupg2 \
    && apt-get install -y libjansson4 \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y golang \
    && apt-get install -y  \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN useradd --disabled-password --home / container

# Add 'container' user to the sudo group
RUN usermod -aG sudo container

USER container
ENV USER=container HOME=/home/container
WORKDIR /

STOPSIGNAL SIGINT

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]