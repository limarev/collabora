pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                withEnv(['image_name=collabora_final', 'tag=latest']) {
                    sh 'docker run -it \
                        --name ${image_name} \
                        --rm \
                        --volume /var/lib/jenkins/workspace/github_android_app_co-23.05-test:/home/user/lo:rw \
                        ${image_name}:${tag} \
                        /bin/bash'
                    sh 'ls -la'
                }
            }
        }
    }
}