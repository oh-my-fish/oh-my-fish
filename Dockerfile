FROM ohmyfish/fish:2.2.0

COPY . /src/oh-my-fish

# Prevent install from opening a new fish shell
ENV CI WORKAROUND

# Replace this when offline installation is supported
ARG OMF_REPO_BRANCH=master
ARG OMF_REPO_URI=https://github.com/oh-my-fish/oh-my-fish

RUN fish /src/oh-my-fish/bin/install

WORKDIR /root/.local/share/omf
