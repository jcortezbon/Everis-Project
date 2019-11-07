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
                sshagent (credentials: ['deploy-dev']) {
                    sh 'ssh -o StrictHostKeyChecking=no -l cloudbees 191.238.217.126 uname -a -p 2299'
                }
            }
        }
        stage('Test') {
            steps {
                echo '------------------Testing...---------------'
            }
        }
        
        stage('build && SonarQube analysis') {
            steps {
                echo '------------------sonar...---------------'
 //               withSonarQubeEnv('SonarQubeSr') {
                    // Optionally use a Maven environment you've configured already
 //                   withMaven(maven:'Maven3.6.2') {
 //                       sh 'mvn clean package sonar:sonar'
 //                   }
 //               }
            }
        }

        stage('Deploy') {
            steps {
                echo '------------------Deploying...----------------'
            }
        }
    }
}