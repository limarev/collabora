FROM collabora_android:latest

RUN useradd -ms /bin/bash user

USER user
WORKDIR /home/user
