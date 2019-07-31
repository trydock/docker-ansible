# Alpine 3.9
FROM alpine:3.10

RUN apk --update add python py-pip openssl ca-certificates sshpass openssh-client rsync sudo vim bash git ansible
RUN apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base
RUN pip install boto3 botocore
RUN apk del build-dependencies
RUN rm -rf /var/cache/apk/*
RUN mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
