node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('BUILD'){
        withCredentials([file(credentialsId: 'serviceaccount', variable: 'service')]) {
        sh 'docker --version'
        sh "cp ${service} . "
        sh 'pwd; ls'
        }         
    }
}
