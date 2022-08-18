node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('Build'){
        withCredentials([file(credentialsId: 'appointy_prod_staging-production_service_account', variable: 'service')]) {
        sh "echo $podname"
        sh "cp ${service} ./serviceacc.json"
        sh "docker build --build-arg podname=${podname} -t podrestart:${BUILD_NUMBER} ."
        }         
    }

    stage('Pod Restart') {
        def containerId = sh(script: "docker run -itd --name podrestart podrestart:${BUILD_NUMBER}", returnStdout: true)
        sh "echo ${containerId}"
        sh 'sleep 4m'
    }
    
    stage('Delete Container') {
        sh "docker cp podrestart:/tmp/output /tmp/output"
        sh "docker rm -f podrestart"
        sh 'docker rmi podrestart:${BUILD_NUMBER}'
    }
    
    stage('Output') {
        sh "cat /tmp/output"
        sh 'rm /tmp/output'
        cleanWs()
    }
}
