pipeline {
	agent any
	stages {
		stage ('build stage') {
			steps {
				sh "docker build express -t express:v1 -f express/Dockerfile"
			}
		}
        stage ('Stop and Remove old container') {
            agent any
            steps {
                script {
                    sh "docker stop \$(docker ps -qf name=express)"
                    sh "docker rm \$(docker ps -a -qf name=express)"
                }
            }
        }
        stage ('Deploy Container') {
            steps{
                sh "docker run -d -p 3000:3000 --name=express express:v1"
            }
            
        }
        stage ('Check API') {
            steps {
                sh "curl http://40.121.40.94:3000/"
            }
        }
	}
}