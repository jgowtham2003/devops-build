pipeline {
    agent any

        environment {
            DOCKER_IMAGE = 'project0'
            DOCKER_CREDENTIALS = 'dockerhub-credentials'
            GIT_REPO = 'https://github.com/jgowtham2003/devops-build.git'
        }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'develop', url: "${GIT_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Docker Pipeline plugin
                    docker.build("${DOCKER_IMAGE}:dev${BUILD_NUMBER}", ".")
                }
            }
        }

    }

    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}

