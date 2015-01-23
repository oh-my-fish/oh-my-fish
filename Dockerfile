FROM ubuntu:latest

# Install dependencies
RUN apt-get -y install curl git software-properties-common

# Set bootstrap script environment variables
ENV FISH_PPA=nightly-master \
  TRAVIS_OS_NAME=linux TRAVIS_REPO_SLUG=bpinto/oh-my-fish TRAVIS_BRANCH=master

# Cache script folder
ADD script /src/script

# Install fish and oh-my-fish
RUN /src/script/bootstrap.sh

WORKDIR /root/.oh-my-fish

CMD ["fish", "./script/run-tests.fish", "--verbose"]
