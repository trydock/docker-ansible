# Alpine 3.9
FROM alpine:3.9

RUN apk --update add python py-pip openssl ca-certificates sshpass openssh-client rsync sudo vim bash
RUN apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base
RUN pip install --upgrade pip pycrypto cffi
RUN pip install ansible==2.3.1
RUN apk del build-dependencies
RUN rm -rf /var/cache/apk/*
RUN mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
