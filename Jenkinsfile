@Library('my-shared-library@master') _

def remote = [:]
    remote.name = 'root'
    remote.host = '191.238.217.126'
    remote.port = 4432
    remote.user = 'root'
    remote.password = 'admin123'
    remote.allowAnyHosts = true

def remote2 = [:]
    remote2.name = 'jcortezb'
    remote2.host = '191.238.217.126'
    remote2.port = 4499
    remote2.user = 'jcortezb'
    remote2.password = 'Stigre_18admin'
    remote2.allowAnyHosts = true


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
        stage('build-package') {
            steps {
                sshCommand remote: remote, command: "cd /var/java-app/simple-app && mvn package"
                //sshCommand remote: remote, command: ""
            }
        }
        stage('test && SonarQube analysis') {
            steps {
                sshCommand remote: remote, command: "cd /var/java-app/simple-app && mvn sonar:sonar -Dsonar.projectKey=jenkins -Dsonar.host.url=http://191.238.217.126:9000 -Dsonar.login=e149ea04ebeb2b15b29650d6a15d7ed4c66ad4c2"
                //sshCommand remote: remote, command: ""
            }
        }
      
         stage('deploy') {
            steps {
                sshCommand remote: remote2, command: "docker commit maven-ssh jcortezb/maven-ssh:0.1 && docker push jcortezb/maven-ssh:0.1"
            }
        }
    }
}
