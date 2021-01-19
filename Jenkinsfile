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
                sh "docker run -d -p 3010:3010 --name=express express:v1"
            }
            
        }
        stage ('Check Application Availability') {
            steps{
        	sh "bash testing.sh"
      		}	
        }
	}
}
