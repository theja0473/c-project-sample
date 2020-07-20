pipeline {
    agent { label 'rpi' }
    environment{
          Micro_var = 'theja_0473'
          python_exe_path = "/usr/bin/python"
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
            }
        }
        stage('Build'){
            steps {
                echo 'Build Job'
            }
        }
    }
    post { 
        always { 
            echo 'I will always run after build!'
        }
    }
}
