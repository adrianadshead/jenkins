pipeline {
    agent { dockerfile {additionalBuildArgs  '--network host -t platform-tests'} }
    stages {
        stage('Test') {
            steps {
              sh 'echo User is ${USER}'
              sh 'echo Home is ${HOME}'
              sh 'dapr run --placement-host-address aaws.singlewire.lan -- pytest'
            }
        }
    }
}