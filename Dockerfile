FROM ubuntu:16.04

MAINTAINER mazyod mazyod@gmail.com

# Avoid error messages from apt during image build
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install -y wget curl

RUN \
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
  dpkg -i erlang-solutions_1.0_all.deb && \
  apt-get update && \
  apt-get install -y esl-erlang elixir build-essential openssh-server git locales

RUN \
  apt-get update && \
  curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs

# Elixir requires UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN update-locale LANG=$LANG

RUN mix local.hex
RUN mix local.rebar
