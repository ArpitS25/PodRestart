node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('Build'){
        withCredentials([file(credentialsId: 'appointy_prod_staging-production_service_account', variable: 'service')]) {
        sh "echo $podname"
        sh "cp ${service} ./serviceaccount1.json"
        sh "docker build -t podrestart:${BUILD_NUMBER} ."
        }         
    }

    stage('Pod Restart') {
        def containerId = sh(script: "docker run -itd -e podname=${podname} --name podrestart${BUILD_NUMBER} podrestart:${BUILD_NUMBER}", returnStdout: true)
        sh "echo ${containerId}"
        sh 'sleep 4m'
    }
    
    stage('Delete Container') {
        sh "docker rm -f podrestart${BUILD_NUMBER}"
        sh 'docker rmi podrestart:${BUILD_NUMBER}'
    }  
}
