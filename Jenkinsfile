pipeline {
    agent any
    environment {
        WORK_DIR = ''
    }
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.6.3-openjdk-8'
                    args '-v /usr/local/maven:/root/.m2 -u root --security-opt seccomp=unconfined'   //maven配置和缓存
                }
            }
            steps {
                sh 'mvn --version'
                sh 'mvn clean package'
                sh 'chmod -R 777 .'
                sh 'pwd'
                sh 'ls'
                sh 'ls /usr/share/maven/conf'
                script {
                    WORK_DIR = sh(returnStdout: true, script: 'pwd')
                    echo "${WORK_DIR}"
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
