# Kopano-Image

This docker image uses git and ansible to clone an ansible repo and run the playbook


## Quickstart

#### Build Image
```sh
docker build  -t <image_name>:<image_version>
```
#### Run Container
```sh
docker run -d \
	-e ENVIRONMENT="<environment>" \
	-e GIT_REPO="<ssh github repository link>" \
	-e VAULT_PASSWORD="<vault password>" \
	-e SUDO_PASSWORD="<become password>" 
	-v <private key>:/root/.ssh/id_rsa:ro \
	<image>:<version>
```

## Configuration
#### Parameters:
Parameter | Comment
---|---
ENVIRONMENT| Inventory Folder
GIT_REPO|Github Repository
VAULT_PASSWORD|Ansible Password
SUDO_PASSWORD|Become Password
