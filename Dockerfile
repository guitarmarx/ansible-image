FROM alpine:3.10.2

LABEL meteorIT GbR Marcus Kastner
WORKDIR /srv


ENV ENVIRONMENT="" \
	GIT_REPO="" \
	VAULT_PASSWORD="" \
	SUDO_PASSWORD="" 

RUN apk update \
	&& apk add ansible git python openssh py3-netaddr

ADD entrypoint.sh /srv
RUN echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config \
	&& chmod +x /srv/entrypoint.sh


ENTRYPOINT ["/srv/entrypoint.sh"]
