# kali linux latest with useful tools
FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive

# update
RUN apt-get -y update \
    && apt-get upgrade -y \
    && apt-get -y dist-upgrade \
    && apt-get -y autoremove \
    && apt-get clean

# install kali linux 'top 10' metapackage and a few useful tools
RUN apt-get -y install \
    kali-linux-top10 \
    dirb \
    exploitdb \
    gdb \
    git \
    gobuster \
    man-db \
    masscan \
    netcat \
    net-tools \
    nikto \
    nodejs \
    npm \
    pciutils \
    proxychains \
    python-pip \
    seclists \
    tor \
    uniscan \
    usbutils \
    wfuzz \
    wpscan \
    zsh

# install zsh shell with custom settings and set it as default shell
RUN sh -c "$(wget -qO- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# send a custom .zshrc
COPY config/.zshrc /root/.zshrc

# configure proxychains with tor
COPY config/proxychains.conf /etc/proxychains.conf

# untar rockyou.txt
RUN tar -xzf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz -C /usr/share/seclists/Passwords/Leaked-Databases/

ENTRYPOINT ["/bin/zsh"]
