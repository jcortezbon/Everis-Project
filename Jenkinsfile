@Library('my-shared-library@master') _

pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
                gitCheckout(
                branch: "master",
                url: "https://github.com/jcortezbon/Everis-Project.git"
                )
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'ls -la'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        
        stage('Sonar Publish') {
            steps {
                // One or more steps need to be included within the steps block.
            }

            tools {
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}