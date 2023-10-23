FROM collabora_base:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

# установка android command line tools и android sdk
ARG android_sdk=/opt/android_sdk
ARG cmdline_tools_path=$android_sdk/cmdline-tools/latest
ENV PATH="${PATH}:$cmdline_tools_path/bin"


# 7302050
# 9477386
ARG CLTOOLS_VERSION=10406996
RUN curl https://dl.google.com/android/repository/commandlinetools-linux-${CLTOOLS_VERSION}_latest.zip -o cmdtools.zip \
&& unzip cmdtools.zip \
&& rm cmdtools.zip \
&& mkdir -p $cmdline_tools_path \
&& mv /cmdline-tools/* $cmdline_tools_path \
&& yes | sdkmanager --licenses \
&& sdkmanager --install "ndk-bundle" "ndk;23.2.8568313" "platform-tools" "platforms;android-21" "build-tools;34.0.0" "extras;google;m2repository" "extras;android;m2repository"
