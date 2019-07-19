FROM zocker160/x2go-xfce:nvidia

MAINTAINER zocker-160

ENV NVIDIA_DRIVER_CAPABILITIES all

RUN add-apt-repository -y ppa:stebbins/handbrake-releases
RUN apt-get update
RUN apt-get install -y handbrake-gtk

# add handbrake to desktop
ADD Handbrake.desktop /home/linux/Desktop/
RUN chmod +x /home/linux/Desktop/Handbrake.desktop
RUN chown linux:linux /home/linux/Desktop/Handbrake.desktop

WORKDIR /home/linux
VOLUME /home/linux/Handbrake-Video/

ENTRYPOINT /usr/sbin/sshd -D
