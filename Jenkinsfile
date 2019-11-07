@Library('my-shared-library@master') _

def remote = [:]
    remote.name = 'root'
    remote.host = '191.238.217.126'
    remote.port = 4432
    remote.user = 'root'
    remote.password = 'admin123'
    remote.allowAnyHosts = true

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
        stage('Compile') {
            steps {
                sshCommand remote: remote, command: "cd /var/java-app/simple-app && mvn compile"
                //sshCommand remote: remote, command: ""
            }
        }
        stage('package') {
            steps {
                sshCommand remote: remote, command: "pwd"
                //sshCommand remote: remote, command: ""
            }
        }
        stage('test && SonarQube analysis') {
            steps {
                sshCommand remote: remote, command: "pwd"
                //sshCommand remote: remote, command: ""
            }
        }
      
         stage('deploy') {
            steps {
                sshCommand remote: remote, command: "pwd"
                //sshCommand remote: remote, command: ""
            }
        }
    }
}
