FROM ubuntu:20.04


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
default-jdk \
build-essential \
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
&& apt-get upgrade -y \
&& rm -rf /var/lib/apt/lists/* \
&& apt clean autoclean && apt autoremove -y


# установка android command line tools и android sdk
ARG android_sdk=/opt/android_sdk
ARG cmdline_tools_path=$android_sdk/cmdline-tools/latest
ENV PATH="${PATH}:$cmdline_tools_path/bin"


COPY --link certs /certs/

# 7302050
# 9477386
RUN for cert in /certs/*; do openssl x509 -in "$cert" -text | sed -ne '/BEGIN CERTIFICATE/,/END CERTIFICATE/p' > "/usr/local/share/ca-certificates/$(basename "$cert" .pem).crt"; done \
    && update-ca-certificates \
&& curl https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -o cmdtools.zip \
&& unzip cmdtools.zip \
&& rm cmdtools.zip \
&& mkdir -p $cmdline_tools_path \
&& mv /cmdline-tools/* $cmdline_tools_path \
&& yes | sdkmanager --licenses \
&& sdkmanager --install "ndk-bundle" "platform-tools" "platforms;android-21" "build-tools;34.0.0" "extras;google;m2repository" "extras;android;m2repository"


ARG uid=1000
ARG gid=1000
ARG USER_NAME=user
ARG root_password=toor

RUN groupadd ${USER_NAME} -g ${gid} \
&& useradd \
--create-home \
--uid ${uid} \
--gid ${gid} \
--shell /bin/bash \
--home-dir /home/${USER_NAME} \
${USER_NAME} \
&& chown -R "${uid}:${gid}" /home/${USER_NAME} \
&& echo "root:${root_password}" | chpasswd \
&& echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
&& usermod -aG sudo "${USER_NAME}"

USER user
WORKDIR /home/user
