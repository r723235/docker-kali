# kali linux latest with useful tools
FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
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
    && apt-get install -y systemctl \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

RUN service postgresql start && msfdb init

RUN mkdir -p /usr/share/seclists \
    && git clone https://github.com/danielmiessler/SecLists.git /usr/share/seclists
RUN tar -xzf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz -C /usr/share/seclists/Passwords/Leaked-Databases/

RUN mkdir /tools \
    && git clone https://github.com/Tib3rius/AutoRecon.git /tools/AutoRecon
WORKDIR /tools/AutoRecon
RUN pip3 install -r requirements.txt \
    && ln -s /tools/AutoRecon/autorecon.py /usr/local/bin/autorecon

WORKDIR /
RUN sh -c "$(wget -qO- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
COPY config/.zshrc /root/.zshrc

CMD /bin/zsh
