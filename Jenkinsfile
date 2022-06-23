node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('DockerTest1'){
        sh 'docker version'
        sh 'docker run -itd nginx'
    }
}
