FROM debian:stretch
LABEL maintainer="magiclobster@mailbox.org"
ENV REPO https://github.com/xmrig/xmrig.git

RUN apt-get update && apt-get -y install \
	git-core \
	libssl-dev \
	cmake \
	build-essential \
	libuv1-dev \
	libmicrohttpd-dev \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

ARG GIT_TAG
RUN mkdir /xmrig && mkdir /build && \
	git clone --branch ${GIT_TAG} ${REPO} /build && \
	sed -i  's|constexpr const int kDonateLevel.*|constexpr const int kDonateLevel = 0;|' /build/src/donate.h && \
	cd /build && cmake . && make && cp xmrig /usr/local/bin/ && rm -rf /build

COPY config.json /xmrig/
ENTRYPOINT ["xmrig", "--config=/xmrig/config.json"]
