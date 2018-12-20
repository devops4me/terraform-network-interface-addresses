
FROM ubuntu:18.04
USER root

# --->
# ---> The python environment is moulded to satisfy the needs
# ---> of the python script that reads the ENI IP addresses.
# --->

RUN apt-get update && apt-get --assume-yes install -qq -o=Dpkg::Use-Pty=0 \
      curl            \
      git             \
      python-pip      \
      build-essential \
      libssl-dev      \
      libffi-dev      \
      python-dev      \
      unzip

# --->
# ---> Install Terraform 0.11.9
# --->

RUN \
    curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.9/terraform_0.11.9_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin && \
    chmod a+x /usr/local/bin/terraform         && \
    rm /tmp/terraform.zip                      && \
    terraform --version


USER ubuntu
WORKDIR /home/ubuntu
