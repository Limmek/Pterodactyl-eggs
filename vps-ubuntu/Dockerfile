FROM  --platform=$TARGETOS/$TARGETARCH ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
# Add container user with a different UID (1000)
RUN useradd -u 1000 -d /home/container -s /bin/bash -m container

# Update base packages
RUN apt update \
    && apt upgrade -y

# Install dependencies
RUN apt-get install -y wget bash curl ca-certificates nginx iproute2 ffmpeg zip unzip sudo make git lolcat figlet toilet binutils locales init-system-helpers \
    && apt-get install -y --no-install-recommends python3 python3-pip php gnupg2 \
    && apt-get install -y libjansson4 \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt update \
    && apt-get install -y golang

RUN pip install --upgrade pip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configure locale
RUN update-locale lang=en_US.UTF-8 \
    && dpkg-reconfigure --frontend noninteractive locales

# Add 'container' user to the sudo group
RUN usermod -u 999 -aG sudo container
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER container
ENV USER=container HOME=/home/container
WORKDIR /

STOPSIGNAL SIGINT

COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]