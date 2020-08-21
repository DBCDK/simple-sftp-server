#!groovy

def workerNode = "devel10"

pipeline {
	agent {label workerNode}
	environment {
		GITLAB_PRIVATE_TOKEN = credentials("metascrum-gitlab-api-token")
		DOCKER_TAG="${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
	}
	options {
		timestamps()
		disableConcurrentBuilds()
	}
	stages {
		stage("clear workspace") {
			steps {
				deleteDir()
				checkout scm
			}
		}
		stage("build") {
			steps {
				sh """
					./build
					"""
			}
		}

		stage("docker push") {
			when {
                branch "master"
            }
			steps {
				script {
					docker.image("docker.dbc.dk/simplesftpserver:${DOCKER_TAG}").push()
				}
			}
		}

	}
}
