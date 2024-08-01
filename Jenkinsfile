pipeline {
    agent any
 
    environment {
        DOCKER_IMAGE = "murtazaj2/flask-app:latest"
        KUBERNETES_DEPLOYMENT = "flask-app-deployment"
        KUBERNETES_SERVICE = "flask-app-service"
    }
 
    stages {
        stage('Clone Repository') {
            steps {
		git 'https://github.com/MurtazaJ2/flask-app.git'
            }
        }
 
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
                    docker.withRegistry('', 'dockerhub-credentials') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
 
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    kubectl apply -f k8s/deployment.yaml
                    kubectl apply -f k8s/service.yaml
                    '''
                }
            }
        }
    }
}