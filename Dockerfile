FROM ubuntu:latest

# Install dependencies
RUN apt-get -y install curl git software-properties-common

# Set bootstrap script environment variables
ENV FISH_PPA=nightly-master \
  TRAVIS_OS_NAME=linux TRAVIS_REPO_SLUG=bpinto/oh-my-fish TRAVIS_BRANCH=master

# Cache script folder
ADD script /src/script
WORKDIR /src

# Install fish
RUN ./script/bootstrap.sh

ADD . /src

CMD ["fish", "./script/run-tests.fish", "--verbose"]

