pipeline {
    agent {
        docker { 
                image 'python:alpine3.15'
                args '-u root --privileged'
            }
    }
    stages {
        stage('Build') {
            steps {
                git credentialsId: 'Github-DeployKey', url: 'git@github.com:hasithvm/personal-website.git'
                sh 'pip install -r requirements.txt'
                // build dependencies include git for HEAD
                sh 'apk update && apk add git zip'
                sh 'nikola build '

            }

            post {
                success {
                    sh 'cd output && zip -r ../output.zip .'
                    archiveArtifacts 'output.zip,output/**'
                }
            }
        }
    }
}
