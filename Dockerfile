FROM ohmyfish/fish:2.3.0

COPY . /src/oh-my-fish

RUN fish /src/oh-my-fish/bin/install --offline --noninteractive --yes

WORKDIR /root/.local/share/omf
