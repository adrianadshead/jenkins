pipeline {
    agent { 
      dockerfile {
        additionalBuildArgs  '--network host -t platform-tests'
        args '-u root'
      }
    }
    stages {
        stage('Test') {
            steps {
              sh 'dapr run --placement-host-address aaws.singlewire.lan -- pytest -V'
              sh 'ls -la'
              sh 'dapr run --placement-host-address aaws.singlewire.lan -- pytest --junitxml results.xml tests'
            }
        }
    }
    post {
        always {
            junit 'results.xml'
        }
    }
}