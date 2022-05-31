#!groovy

def workerNode = "devel10"

pipeline {
	agent {label workerNode}
	environment {
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
					docker.image("docker-dbc.artifacts.dbccloud.dk/simplesftpserver:${DOCKER_TAG}").push()
					docker.image("docker-dbc.artifacts.dbccloud.dk/simplesftpserver:${DOCKER_TAG}").push("latest")
					docker.image("docker-dbc.artifacts.dbccloud.dk/socks5proxy:${DOCKER_TAG}").push()
					docker.image("docker-dbc.artifacts.dbccloud.dk/socks5proxy:${DOCKER_TAG}").push("latest")
				}
			}
		}

	}
}
