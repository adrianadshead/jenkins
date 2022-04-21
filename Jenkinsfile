pipeline {
    agent { dockerfile {additionalBuildArgs  '--network host -t platform-tests'} }
    stages {
        stage('Test') {
            steps {
              sh 'dapr run --placement-host-address aaws.singlewire.lan -- pytest'
            }
        }
    }
}