pipeline{
    agent any

    stages{
        stage("Linting"){
            steps{
                echo "Linting HTML Code"
                sh "tidy --drop-empty-elements false --drop-empty-paras false -qe public/*.html"
                echo "Linting Dockerfile"
                sh "hadolint Dockerfile"
            }
        }
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
        stage ('Deploy to EKS') {
            steps {
                sh "kubectl set image deployments/nd9991-capstone-app nd9991-capstone-app=dbarahona/nd9991-capstone-app:${env.GIT_COMMIT[0..7]} --record"
            }
        }
    }
}