FROM alpine:3.12.3

LABEL meteorIT GbR Marcus Kastner
WORKDIR /srv


ENV ENVIRONMENT="" \
	GIT_REPO="" \
	VAULT_PASSWORD="" \
	SUDO_PASSWORD="" \
	ANSIBLE_FORCE_COLOR=true

RUN apk update \
	&& apk add ansible git python3 openssh py3-netaddr

RUN ansible-galaxy collection install community.kubernetes community.general ansible.posix community.kubernetes

ADD entrypoint.sh /srv
RUN mkdir -p ~/.ssh/ \
	&& echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config \
	&& chmod +x /srv/entrypoint.sh


ENTRYPOINT ["/srv/entrypoint.sh"]
