pipeline {
    agent { dockerfile {additionalBuildArgs  '--network host -t platform-tests'} }
    stages {
        stage('Test') {
            steps {
              sh 'echo Hello World'
            }
        }
    }
}