FROM armv7/armhf-ubuntu

ENV LANG=en_CA.UTF-8

RUN apt-get update && apt-get install -y amule-daemon amule-utils amule-utils-gui

ADD entrypoint.sh /root/

VOLUME ["/root/.aMule"]

ENTRYPOINT ["/root/entrypoint.sh"]
