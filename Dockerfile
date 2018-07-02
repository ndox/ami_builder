FROM registry.access.redhat.com/openshift3/ose-ansible:v3.6

USER root

RUN mkdir /root/packer

WORKDIR /root/packer


RUN yum install unzip wget -y

RUN wget https://releases.hashicorp.com/packer/1.2.1/packer_1.2.1_linux_amd64.zip
RUN wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip


RUN unzip packer_1.2.1_linux_amd64.zip
RUN unzip terraform_0.11.1_linux_amd64.zip
RUN mv packer /usr/local/bin/packer
RUN mv terraform /usr/local/bin/terraform
RUN rm packer_1.2.1_linux_amd64.zip
RUN rm terraform_0.11.1_linux_amd64.zip
RUN mkdir /root/git

WORKDIR /root/git


RUN yum install git -y


