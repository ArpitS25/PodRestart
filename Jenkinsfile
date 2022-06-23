node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('BUILD'){
        withCredentials([file(credentialsId: 'serviceaccount', variable: 'service')]) {
        sh 'docker --version'
        sh 'whoami'
        sh "cp ${service} ./serviceacc.json"
        sh 'pwd; ls'
//       sh "docker build -t podrestart:${BUILD_NUMBER} ."
        }         
    }

    stage('Container') {
        def containerId = sh(script: 'docker run -itd nginx', returnStdout: true)
        sh "echo ${containerId}"
        }
    
    post { 
        always { 
            cleanWs()
        }
    }
}
