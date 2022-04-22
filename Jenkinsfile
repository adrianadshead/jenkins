pipeline {
    agent { 
      dockerfile {
        additionalBuildArgs  '--network host -t platform-tests'
        args '-u jenkins:root'
      }
    }
    stages {
        stage('Test') {
            steps {
              sh 'dapr run --placement-host-address aaws.singlewire.lan -- pytest -V'
            }
        }
    }
}