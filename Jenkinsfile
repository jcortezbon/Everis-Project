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
                echo '-----------------conectando a VM...--------------'
                withCredentials([sshUserPrivateKey(credentialsId: '7106d0fd-bf4b-47fc-9d16-181c9f287274', keyFileVariable: 'vm', passphraseVariable: 'pass', usernameVariable: 'user-vm')]) {
                    sh 'ssh -p 2299 jcortezb@191.238.217.126'
                    
                    
                    //sh -o'ssh -p 2299 user-vm'
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