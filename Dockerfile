FROM alpine:3.11.6

WORKDIR /app

# Prep base system
RUN set -e \
	&& ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
	&& apk --update add --no-cache --virtual .build-deps \
	&& apk add --no-cache \
		build-base \
		python3-dev \
		libffi-dev \
		openssl-dev \
		git \
		py3-pip \
		jq \
		curl \
		libffi \
		openssl \
	&& pip3 install --upgrade \
		databricks-cli==0.11 \
	&& apk --purge -v del \
		build-base \
		py3-pip \
		python3-dev \
		libffi-dev \
		openssl-dev \
	&& rm -f /var/cache/apk/*

# Manage the Entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]