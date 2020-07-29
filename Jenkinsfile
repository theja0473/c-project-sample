pipeline {
    agent { label 'rpi' }
    environment{
          Micro_var = 'theja_0473'
          python_exe_path = "/usr/bin/python"
          registry = "theja0473/docker-test"
          registryCredential = 'dockerhub'
          dockerImage = ''
          Build_Status = false
    }
    stages {
        stage('Initial') {
            steps {
                echo 'Initial step'
                echo "Branch_env_var is ${env.Micro_var}"
                echo "Python_exe path is ${env.python_exe_path}"
                println "JOB_NAME is ${env.JOB_NAME}"
                println "JOB_URL is ${env.JOB_URL}"
                println "BUILD_NUMBER is ${env.BUILD_NUMBER}"
                println "BUILD_TAG is ${env.BUILD_TAG}"
                println "BRANCH_NAME is ${env.BRANCH_NAME}"
                println "GIT_AUTHOR_NAME is ${env.GIT_AUTHOR_NAME}"
                println "NODE_NAME is ${env.NODE_NAME}"
                println "Initailly build status is ${env.Build_Status}"
                sh "mv ${workspace}/DOCKERFILE ${workspace}/Dockerfile"
            }
        }
        stage('Build Docker'){
        /*    steps {
                echo 'Build Job'
                dockerfile {
                        filename 'Dockerfile'
                        dir 'build'
                        label "${dockerImage}"
                        additionalBuildArgs  '--build-arg version=1.0.0'
                    }
            }*/
            steps{
                script{
                    try {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                    catch (err){
                        echo err.getMessage()
                        echo "Error while building Job but continue"
                        env.Build_Status = true;
                    }
                }
            }
        }
        stage('Deploy DockerHub'){
            steps{
                script{
                    try {
                        docker.withRegistry( '', registryCredential ) {
                            dockerImage.push()
                        }
                    }catch(err) {
                        echo err.getMessage()
                        echo "Builld Failed So, No Docker Image Existed"
                    }
                }
             }
        }
        stage('Remove Unused docker image') {
            steps{
                script{
                    try{
                        sh "docker rmi $registry:$BUILD_NUMBER"
                    } catch (err) {
                        echo err.getMessage()
                        echo "Error detected, but we will continue."
                    }
                }
            }
        }
    }
    post {
        always {
            step{
                if (${env.Build_Status}){
                    echo 'I will always run after build!'
                    println "Build_Status is ${env.Build_Status}"
                }else{
                    println "Build_Status is ${env.Build_Status}"
                }
            }
        }
    }
}
