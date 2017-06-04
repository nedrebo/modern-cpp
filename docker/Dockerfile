FROM base/archlinux
MAINTAINER Mathias Nedrebø <mathias@nedrebo.org>

COPY ArchLinux.sh .

RUN ./ArchLinux.sh && \
    rm ArchLinux.sh && \
    pacman --noconfirm -Scc
