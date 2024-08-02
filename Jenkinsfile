pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "murtazaj2/flask-app:latest"
        KUBERNETES_DEPLOYMENT = "flask-app-deployment"
        KUBERNETES_SERVICE = "flask-app-service"
        KUBECONFIG_PATH = "C:\\Users\\Murtaza\\kubeconfig\\config"
        KUBECTL_PATH = "C:\\Users\\Murtaza\\kubectl"
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

        stage('Deploy to Kubernetes') {
            steps {
				script{
                    bat """
                    ${KUBECTL_PATH} --kubeconfig=${KUBECONFIG_PATH} apply -f deployment.yaml
                    """
                }
			}
        }
    }
}