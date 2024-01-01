pipeline {
  environment {
    dockerimagename = "cloudwithraghu/sslwebsite"
    dockerImage = ""
  }
  agent any
  stages {
    stage('SCM') {
      steps {
        git 'https://github.com/CloudWithRaghu/Jenkins-Docker-SSL-Website.git'
      }
    }
    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }
    stage('Push Image to Docker Hub') {
      environment {
          registryCredential = 'githubcredentials'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploying POD's to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
        }
      }
    }
  }
}
