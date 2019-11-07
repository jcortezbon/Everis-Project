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
        
        stage('SonarQube Analysis') {
            steps {
                def scannerhome = tool 'ScannerTool';
                withSonarQubeEnv ('SonarQubeSr') {
                sh """${scannerhome}/bin/sonar-runer -D sonar.login=admin -D sonar.password=admin"""
                }
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