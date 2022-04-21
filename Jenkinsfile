pipeline {
    agent { dockerfile {additionalBuildArgs  '--network host -t platform-tests'} }
    stages {
        stage('Test') {
            steps {
              sh 'dapr run --components-path /root/.dapr/components --placement-host-address aaws.singlewire.lan -- pytest'
            }
        }
    }
}