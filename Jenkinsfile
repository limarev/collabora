pipeline {
    agent {
        docker { 
            image 'collabora_final:latest'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'pwd'
                sh 'ls -la'
                sh 'sdkmanager --list'
            }
        }
        stage('Fetch external tarballs') {
            steps {
                sh 'make distclean'
                sh './autogen.sh --with-all-tarballs && make fetch'
            }
        }
    }
}