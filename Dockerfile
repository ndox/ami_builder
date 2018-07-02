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

#RUN subscription-manager repos \
#    --enable="rhel-7-server-rpms" \
#    --enable="rhel-7-server-extras-rpms" \
#    --enable="rhel-7-server-ose-3.6-rpms" \
#    --enable="rhel-7-fast-datapath-rpms"

RUN yum install git -y

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm


#RUN yum upgrade -y

#RUN yum install ansible -y
#RUN wget https://github.com/git/git/archive/v2.9.5.zip -O git.zip
#RUN unzip git.zip
#WORKDIR /root/git/git-2.9.5

#RUN make configure
#RUN ./configure --prefix=/usr
#RUN make all
#RUN make install
