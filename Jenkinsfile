pipeline {
    environment {
	DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
	npm_config_cache = 'npm-cache'
	HOME = '.'
    }
    agent {
        dockerfile true
    }
    stages {
        stage('Checkout') {
            steps {
         	checkout scm
    	    }
	}
        stage('Build') {
            steps {
                echo 'Building..'
		sh 'dotnet build'
                dir ('DotnetTemplate.Web') {
		   sh 'npm install'
  		   sh 'npm run build'
		}
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
		sh 'dotnet test'
                dir ('DotnetTemplate.Web') {
		   sh 'npm t'
                   sh 'npm run lint'
		}
            }
        }
    }
post {
    success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

    }

    failure {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

    }
  }
}
