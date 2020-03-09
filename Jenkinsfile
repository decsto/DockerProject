pipeline {
  def app
 
  stages {
    stage('Cloning Git') {
      steps {
       checkout scm
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
   
