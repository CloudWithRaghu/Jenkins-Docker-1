node {
  stage('Apply Kubernetes files') {
    withKubeConfig([credentialsId: 'kube-serviceAccount', serverUrl: 'https://192.168.0.4:6443']) {
      sh 'kubectl apply -f deployment.yaml'
      sh 'kubectl apply -f service.yaml'
    }
  }
}
