pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add your build commands here (e.g., mvn clean package)
            }
        }
        stage('Test') {
            steps {
                echo 'Running automated tests...'
                // Add your test scripts here
            }
        }
        stage('Package Docker Image') {
            steps {
                script {
                    // Builds the Docker image using your project's Dockerfile
                    app = docker.build("ironman41732029/my-web-app:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push to Registry') {
            steps {
                script {
                    // Pushes container image to Docker Hub securely using saved credentials
                    docker.withRegistry('https://registry.hub.docker.com', '71fed352-af19-4633-83d1-07c0afbfa360') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application using rolling/blue-green strategy...'
                // Add deployment and verification commands here
            }
        }
    }
}