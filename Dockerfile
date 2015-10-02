FROM ubuntu

RUN echo "Installing fish"
RUN sudo apt-get install -y software-properties-common && \
  sudo apt-add-repository ppa:fish-shell/release-2 && \
  sudo apt-get -y update && \
  sudo apt-get -y install fish

RUN echo "Installing dependencies"
RUN sudo apt-get -y install curl git tree

