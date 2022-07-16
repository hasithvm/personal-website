pipeline {
    agent any
    stages {
        stage('Build-Python') {
            agent {
                docker { 
                    image 'python:alpine3.15'
                    reuseNode true
                    // pip
                    args '-u root'
                }
            }
            steps {
                git credentialsId: 'Github-DeployKey', url: 'git@github.com:hasithvm/personal-website.git'
                sh 'pip install -r requirements.txt'
                // build dependencies include git for HEAD
                sh 'apk update && apk add git zip'
                sh 'nikola build '
                sh 'chmod -R 777'
            }


        }
        stage ('build-docker-image')
        {
            steps
            {
                sh 'cp -R .docker/ output/'
                script{
                   dockerImage = docker.build("personal-website:${env.BUILD_ID}", "-f ./.docker/Dockerfile ./output") 
                }
            }


        }
    }
    post {
    success {
        sh 'cd output && tar -czf /tmp/website.gz .'
        archiveArtifacts '/tmp/website.gz,output/**'
    }
}
}
