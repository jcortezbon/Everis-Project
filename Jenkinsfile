@Library('my-shared-library@dockerfile') _

pipeline {
    agent {
        dockerfile {
            filename 'dockerfile.build'
            dir 'build'
            label 'mydocker'
            additionalBuildArgs '--build-arg version=1.0.2'
            args '-v /tmp:/tmp'
        }
    }
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
        
        stage('SonarQube') {
            steps {
                echo 'Testing...'
                // One or more steps need to be included within the steps block.
            }
        }

        stage('Deploy') {
            steps {
                echo '------------------Deploying...----------------'
            }
        }
    }
}