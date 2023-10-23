pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'collabora_final:latest'
                     args '-v ${WORKSPACE}:/home/user/lo'
                    reuseNode true
                }
            }
            steps {
                sh 'pwd'
                sh 'ls -la'
                sh 'ls -la /home/user/lo'
            }
        }

    }
}
