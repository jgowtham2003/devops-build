pipeline {
    agent any

        environment {
	    DOCKER_REPO = 'gowtham3636/prod'
            DOCKER_IMAGE = 'gowtham3636/prod'
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
				    docker.build("${DOCKER_IMAGE}:prod${BUILD_NUMBER}", ".")
			    }
		    }
	    }
	    stage('Deploy image') {
		    steps {
			    script{
				    docker.withRegistry('https://registry.hub.docker.com',DOCKER_CREDENTIALS) {
					    docker.image("${DOCKER_IMAGE}:prod${BUILD_NUMBER}").push()

			    	}
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

