node {
    
    stage('Clone Github repository') {
        git branch: 'main', credentialsId: 'raghav-creds', url: 'https://github.com/CloudWithRaghu/jenkins-kubernetes-ssl-website.git'
    }
    
    stage('Apply Kubernetes files') {
    withKubeConfig([credentialsId: 'kube-creds', serverUrl: 'https://10.0.0.4:6443']) {
      sh 'kubectl apply -f deployment.yaml'
      sh 'kubectl apply -f service.yaml'
       sh '''#!/bin/bash
                 kubectl patch svc service-website -n default -p '{"spec": {"type": "LoadBalancer", "externalIPs":["10.0.0.4"]}}'
         '''
     }
  }
}
