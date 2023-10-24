FROM collabora_android:latest

RUN useradd -ms /bin/bash user

USER user
WORKDIR /home/user

COPY entrypoint.sh /home/user

ENV ANDROID_SDK_PATH=/opt/android_sdk
ENV NDK_PATH=${ANDROID_SDK_PATH}/ndk-bundle

ENTRYPOINT [ "./entrypoint.sh" ]
