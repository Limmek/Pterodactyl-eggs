FROM ubuntu:22.04

# Set noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

# Update base packages
RUN apt update \
    && apt upgrade -y

# Install dependencies
RUN apt-get install -y wget bash curl ca-certificates nginx iproute2 ffmpeg zip unzip sudo make git lolcat figlet toilet \
    && apt-get install -y --no-install-recommends python3 python3-pip php gnupg2 \
    && apt-get install -y libjansson4 \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt update \
    && apt-get install -y golang \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN useradd -m -d /home/container -s /bin/bash container

RUN echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers
# Add 'container' user to the sudo group
RUN usermod -aG sudo container

USER container
ENV USER=container HOME=/home/container
WORKDIR /

STOPSIGNAL SIGINT

COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]