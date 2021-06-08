pipeline {
    agent {
        docker { dockerfile true }
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
                sh 'cd /workspace/DevOps-Course-Workshop-Module-07-Learners'
		sh 'dotnet build'
                sh 'cd /workspace/DevOps-Course-Workshop-Module-07-Learners/DotnetTemplate.Web'
		sh 'npm install'
  		sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
		sh 'cd /workspace/DevOps-Course-Workshop-Module-07-Learners'
		sh 'dotnet test'
		sh 'cd /workspace/DevOps-Course-Workshop-Module-07-Learners/DotnetTemplate.Web'
		sh 'npm t'
                sh 'npm run lint'
            }
        }
    }
}
