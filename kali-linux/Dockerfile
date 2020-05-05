# kali linux latest with useful tools
FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

# update
RUN apt-get -y update \
    && apt-get upgrade -y \
    && apt-get -y dist-upgrade \
    && apt-get -y autoremove \
    && apt-get clean

# install several useful tools
RUN apt-get -y install --no-install-recommends \
    amass \
    awscli \
    curl \
    dirb \
    dotdotpwn \
    enum4linux \
    exploitdb \
    file \
    gdb \
    git \
    gobuster \
    hydra \
    impacket-scripts \
    john \
    less \
    lsof \
    man-db \
    masscan \
    metasploit-framework \
    netcat \
    net-tools \
    nikto \
    nmap \
    nodejs \
    npm \
    onesixtyone \
    oscanner \
    pciutils \
    proxychains4 \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    samba \
    seclists \
    smbclient \
    smbmap \
    smtp-user-enum \
    snmpcheck \
    socat \
    ssh-client \
    sslscan \
    sslyze \
    sqlmap \
    systemd \
    tnscmd10g \
    tor \
    uniscan \
    usbutils \
    vim \
    wfuzz \
    whatweb \
    wpscan \
    zip \
    zsh \
    && apt-get install -y --no-install-recommends systemctl \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

# initialize metasploit database
RUN service postgresql start && msfdb init

# install and configure autorecon
RUN mkdir /tools \
    && git clone --depth 1 https://github.com/Tib3rius/AutoRecon.git /tools/AutoRecon \
    && cd /tools/AutoRecon \
    && pip3 install -r requirements.txt \
    && ln -s /tools/AutoRecon/autorecon.py /usr/local/bin/autorecon

# install zsh shell with custom settings and set it as default shell
RUN sh -c "$(wget -qO- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# send a custom .zshrc
COPY config/.zshrc /root/.zshrc

# untar rockyou.txt
RUN tar -xzf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz -C /usr/share/seclists/Passwords/Leaked-Databases/

ENTRYPOINT ["service postgresql start && /bin/zsh"]
