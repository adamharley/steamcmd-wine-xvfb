FROM wilkesystems/steamcmd

ENV TIMEZONE=Europe/London

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y apt-transport-https software-properties-common gnupg wget && \
	wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
	apt-add-repository https://dl.winehq.org/wine-builds/debian && \
	apt-get update && \
	apt-get install --no-install-recommends -y winehq-staging xvfb && \
	apt-get purge -y software-properties-common gnupg wget && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["wine64"]