FROM extremedevops/erlang:17.5.3
MAINTAINER Leandro David Cacciagioni <leandro.21.2008@gmail.com>

ADD locales /etc/profile.d/locales.sh

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get dist-upgrade -qqy --force-yes && \
  apt-get install -qqy --force-yes unzip && \
  mkdir -p /opt/elixir && \
  wget https://github.com/elixir-lang/elixir/releases/download/v1.0.5/Precompiled.zip -O /opt/elixir/elixir.zip && \
  cd /opt/elixir/ && unzip elixir.zip && \
  rm -rf /opt/elixir/elixir.zip && \
  apt-get autoremove -qqy && \
  apt-get clean && apt-get autoclean && \
  rm -rf /usr/share/man/?? && rm -rf /usr/share/man/??_*

ENV PATH="${PATH}:/opt/elixir/bin"

CMD iex
