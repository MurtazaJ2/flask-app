pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "murtazaj2/flask-app:latest"
        KUBERNETES_DEPLOYMENT = "flask-app-deployment"
        KUBERNETES_SERVICE = "flask-app-service"
        KUBECONFIG_PATH = "/home/softnautics/.kube"
        KUBECTL_PATH = "/home/softnautics/.minikube"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
					docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
						docker.withRegistry('', 'docker-cred') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
			}
		}

        stage('Deploy deployment and service file') {
            steps {
                script {
                    kubernetesDeploy(configs: 'deployment.yaml', kubeconfigId: 'kube-cred')
                }
            }
        }
    }
}