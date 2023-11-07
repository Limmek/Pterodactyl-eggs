FROM  --platform=$TARGETOS/$TARGETARCH ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
# Add container user 
RUN useradd -u 999 -d /home/container -s /bin/bash -m container

# Update base packages
RUN apt update \
    && apt upgrade -y

# Install dependencies
RUN apt install -y bash sudo cron gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
        libfontconfig icu-devtools libunwind8 sqlite3 libsqlite3-dev libzip4 locales ffmpeg apt-transport-https init-system-helpers \
        libcurl3-gnutls liblua5.1-0 libluajit-5.1-2 libsqlite3-0 bzip2 zlib1g libevent-dev libmariadb-dev-compat libmariadb-dev libssl-dev \
		libfluidsynth-dev libmariadb-dev libicu-dev libssl3 libduktape207 libjsoncpp-dev libleveldb1d libncurses5 libncursesw5 tini 

# configure locale
RUN update-locale lang=en_US.UTF-8 \
    && dpkg-reconfigure --frontend noninteractive locales

# Add 'container' user to the sudo group
RUN usermod -u 999 -aG sudo container
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo 'container ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo ALL >>/etc/cron.allow

USER container
ENV USER=container HOME=/home/container
WORKDIR /

STOPSIGNAL SIGINT

COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]