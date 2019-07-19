FROM zocker160/x2go-xfce:nvidia

MAINTAINER zocker-160

RUN add-apt-repository -y ppa:stebbins/handbrake-releases
RUN apt-get update
RUN apt-get install -y handbrake-gtk

# autostart handbrake
RUN mkdir -p /home/linux/.config/autostart
ADD Handbrake.desktop /home/linux/.config/autostart

ENTRYPOINT /usr/sbin/sshd -D
