pipeline {
    environment {
        ANDROID_SDK_PATH = '/opt/android_sdk'
        NDK_PATH = '${ANDROID_SDK_PATH}/ndk-bundle'
        DISTRO = 'CPAndroid'
    }
    agent {
        docker { 
            image 'collabora_final:latest'
        }
    }
    stages {
        stage('Fetch external tarballs') {
            steps {
                // sh 'echo \
                //     "--with-android-package-name=com.collabora.for.gerrit
                //     --with-android-ndk=\$NDK_PATH
                //     --with-android-sdk=\$ANDROID_SDK_PATH
                //     --with-distro=\$DISTRO
                //     --disable-ccache" > autogen.input'
                sh './autogen.sh \
                    --with-android-package-name=com.collabora.for.gerrit \
                    --with-android-ndk=$NDK_PATH \
                    --with-android-sdk=$ANDROID_SDK_PATH \
                    --with-distro=$DISTRO \
                    --disable-ccache && make'
            }
        }
    }
}