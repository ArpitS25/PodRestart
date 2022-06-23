node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('BUILD'){
        withCredentials([file(credentialsId: 'serviceaccount', variable: 'service')]) {
        sh 'docker --version'
        sh "cp ${service} ./serviceacc.json "
        sh 'pwd; ls'
//       sh "docker build -t podrestart:${BUILD_NUMBER} ."
        }         
    }

    stage('Container') {
            agent {
                docker { image "nginx" }
            }
            steps {
                sh 'ls'
            }
        }

}
