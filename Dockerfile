# Build with: `docker build --network host -t platform-tests .`
#   Run with: `docker run -v $(pwd):/platform-tests -w /platform-tests platform-tests tests`
FROM ubuntu

# Update software to latest versions and install extra os packages
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get -y install apt-utils

# Install dapr
RUN apt-get -y install curl
RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | /bin/bash
RUN dapr init --slim

# Install python 3.8 in a virtualenv
RUN apt-get -y install python3.8 python3.8-venv
ENV VIRTUAL_ENV=/opt/venv
RUN python3.8 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install and configure git
RUN apt-get -y install git
RUN git config --global http.sslVerify false

# Install test dependencies
COPY requirements_jenkins_platform_tests.txt /
RUN pip install pip-tools
RUN pip-sync requirements_jenkins_platform_tests.txt

# Initialize and configure playwright
RUN playwright install
RUN playwright install-deps

# Set user for the testing environment
USER root
# Set entrypoint to hard code test run configuration
# ENTRYPOINT ["dapr", "run", "--placement-host-address", "aaws.singlewire.lan", "--","pytest"]