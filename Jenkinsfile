pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
            }
        }
        stage('DockerTest1'){
            def dockerHome = tool name: 'docker', type: 'dockerTool'
            def dockerCMD = "${dockerHome}/bin/docker"
            sh "${dockerCMD} --version"
        }
        stage('DockerTest2'){
            sh "docker --version"
        }
    }
}
