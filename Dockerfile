FROM alpine:3.10.2

LABEL meteorIT GbR Marcus Kastner
WORKDIR /srv


ENV ENVIRONMENT="" \
	GIT_REPO="" \
	VAULT_PASSWORD="" \
	SUDO_PASSWORD="" \
	ANSIBLE_FORCE_COLOR=true

RUN apk update \
	&& apk add ansible git python openssh py3-netaddr

RUN ansible-galaxy collection install \
		community.kubernetes \
		community.general \
		ansible.posix \
		community.kubernetes \
		community.general.modprobe

ADD entrypoint.sh /srv
RUN mkdir -p ~/.ssh/ \
	&& echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config \
	&& chmod +x /srv/entrypoint.sh


ENTRYPOINT ["/srv/entrypoint.sh"]
