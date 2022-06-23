node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('Build'){
        withCredentials([file(credentialsId: 'serviceaccount', variable: 'service')]) {
        sh 'chmod +x slow.sh'
        sh "cp ${service} ./serviceacc.json"
        sh 'pwd; ls'
        sh "docker build -t podrestart:${BUILD_NUMBER} ."
        }         
    }

    stage('Container') {
        def containerId = sh(script: "docker run -itd --name podrestart podrestart:${BUILD_NUMBER}", returnStdout: true)
        sh "echo ${containerId}"
        cleanWs()
        }
    
    stage('Delete Container') {
        sh "docker rm -f podrestart"
        sh 'docker rmi podrestart:${BUILD_NUMBER}'
    }
}
