pipeline{
    agent{
        label "any"
    }
    stages{
        stage("Build Docker Image"){
            steps{
                script {
                    app_image = docker.build("dbarahona/nd9991-capstone-app")
                }
            }
        }
        stage ('Push Image to Registry') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_id') {
                        app_image.push("${env.GIT_COMMIT[0..7]}")
                        app_image.push("latest")
                    }
                }
            }
        }
    }
}