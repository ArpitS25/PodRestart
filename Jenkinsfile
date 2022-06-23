pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
            }
        }
        stage('DockerTest1'){
            steps {
                def dockerHome = tool name: 'docker', type: 'dockerTool'
                def dockerCMD = "${dockerHome}/bin/docker"
                sh "${dockerCMD} --version"
            }   
        }
        stage('DockerTest2'){
            steps {
                sh "docker --version"
            }
        }
    }
}
