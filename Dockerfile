# Alpine 3.9
FROM alpine:latest

RUN apk --update add python3 py3-pip openssl ca-certificates sshpass openssh-client rsync sudo vim bash git
RUN apk --update add --virtual build-dependencies python3-dev libffi-dev openssl-dev build-base
RUN pip install --upgrade pip pycrypto cffi
RUN pip install ansible
RUN apk del build-dependencies
RUN rm -rf /var/cache/apk/*
RUN mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
