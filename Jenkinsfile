node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('Build'){
        withCredentials([file(credentialsId: 'serviceaccount', variable: 'service')]) {
        sh "cp ${service} ./serviceacc.json"
        sh "docker build -t podrestart:${BUILD_NUMBER} ."
        }         
    }

    stage('Pod Restart') {
        def containerId = sh(script: "docker run -itd --name podrestart podrestart:${BUILD_NUMBER}", returnStdout: true)
        sh "echo ${containerId}"
        sh 'sleep 4m'
    }
    
    stage('Delete Container') {
        sh "docker rm -f podrestart"
        sh 'docker rmi podrestart:${BUILD_NUMBER}'
        cleanWs()
    }
}
