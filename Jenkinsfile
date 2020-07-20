pipeline {
    agent rpi
    stages {
        stage('Initial') {
            steps {
                echo 'Initial step'
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
