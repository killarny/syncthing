FROM debian
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qqy && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qqy curl && \
    apt-get clean && \
    rm -rf /var/lib/apt

RUN curl -s https://syncthing.net/release-key.txt | apt-key add -
RUN echo "deb http://apt.syncthing.net/ syncthing release" | tee /etc/apt/sources.list.d/syncthing.list
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qqy syncthing && \
    apt-get clean && \
    rm -rf /var/lib/apt

ENTRYPOINT ["syncthing", "-gui-address=0.0.0.0:8384"]
