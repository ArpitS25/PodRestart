node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/ArpitS25/PodRestart.git'
    }

    stage('DockerTest1'){
        def dockerHome = tool name: 'docker', type: 'dockerTool'
        def dockerCMD = "${dockerHome}/bin/docker"
        sh "${dockerCMD} --version"
        sh "${dockerCMD} run -itd nginx"
    }
}
