pipeline {
    agent { dockerfile {additionalBuildArgs  '--network host -t platform-tests'} }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
            }
        }
    }
}