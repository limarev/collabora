FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

# установка зависимостей
RUN apt-get update \
&& apt-get install -y \
--no-install-recommends \
--fix-missing \
git \
curl \
unzip \
cmake \
libssl-dev \
ca-certificates \
sudo \
build-essential \
gcc-12 \
g++-12 \
zip \
ccache \
junit4 \
libkrb5-dev \
nasm \
graphviz \
python3 \
python3-dev \
qtbase5-dev \
libkf5coreaddons-dev \
libkf5i18n-dev \
libkf5config-dev \
libkf5windowsystem-dev \
libkf5kio-dev \
autoconf \
libcups2-dev \
libfontconfig1-dev \
gperf \
default-jdk \
openjdk-17-jre \
doxygen \
libxslt1-dev \
xsltproc \
libxml2-utils \
libxrandr-dev \
libx11-dev \
bison \
flex \
libgtk-3-dev \
libgstreamer-plugins-base1.0-dev \
libgstreamer1.0-dev \
ant \
ant-optional \
libnss3-dev \
libavahi-client-dev \
libxt-dev \
autotools-dev \
automake \
gettext \
&& update-alternatives \
--install /usr/bin/gcc gcc /usr/bin/gcc-12 100 \
--slave /usr/bin/g++ g++ /usr/bin/g++-12 \
--slave /usr/bin/gcov gcov /usr/bin/gcov-12 \
&& apt-get upgrade -y \
&& rm -rf /var/lib/apt/lists/* \
&& apt clean autoclean && apt autoremove -y
