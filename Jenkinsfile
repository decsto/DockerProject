pipeline {
    def app
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/decsto/dockerproject.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          app = docker.build("decsto/dockerproject")
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
