pipeline {
    agent { dockerfile {label 'platform-test'} }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
            }
        }
    }
}