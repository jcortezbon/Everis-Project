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
        stage('build') {
            steps {
                echo 'Building...'
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        
        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQubeSr') {
                    // Optionally use a Maven environment you've configured already
                    withMaven(maven:'mymaven 3.6.2') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo '------------------Deploying...----------------'
            }
        }
    }
}