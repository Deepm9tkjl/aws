pipeline{
    agent any
    stages{
        stage('Git clone')
        {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Deepm9tkjl/aws']]])
            }
        }
        stage('Build') {
			steps {
				sh 'docker build -t deeppaakk/aws_docker:latest .'
			}
		}
	stage('Push') {
	    steps {
		script {
		    withCredentials([string(credentialsId: 'dockerhubpw', variable: 'dockerhubpw')]) {
			sh "docker login -u deeppaakk -p ${dockerhubpw}"
	    }
	    sh "docker push deeppaakk/aws_docker"
		}
	    }
	}
			stage('start') {
		    steps {
				    sh "docker run -itd -p 80:80 --name webserver deeppaakk/aws_docker"
		        }
		    }
		
		
		
    }
}
