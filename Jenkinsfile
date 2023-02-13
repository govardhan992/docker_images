pipeline {
 agent any
  options {
        timeout(time: 20, unit: 'MINUTES')
        timestamps()
    }
  
  stages {
   
    stage ('build image') {
      steps {
        sh "docker build -t apache:${BUILD_NUMBER} ."
        sh "docker inspect apache:${BUILD_NUMBER}"
      }
    }
    stage('build container') {
      steps {
        sh "docker rm -f webserver || true"
        sh "docker run -d -p 8081:8081 --name webserver apache:${BUILD_NUMBER}"
        sh "docker ps -a"
        sh "docker logs webserver"
       sh "docker rmi -f apache:${BUILD_NUMBER}"
       sh"docker images"
      }
    }
  }
}
