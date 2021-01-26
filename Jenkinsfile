pipeline {
    agent any
    environment {
        WORK_DIR = '' //项目文件位置
        IMAGE_NAME = 'test'
    }
    stages {
        stage('打包') {
            agent {
                docker {
                    image 'maven:3.6.3-openjdk-8'
                    args '-v /usr/local/maven:/root/.m2 -u root --security-opt seccomp=unconfined'   //maven配置和缓存
                }
            }
            steps {
                sh 'mvn --version'
                sh 'mvn clean package -U'
                sh 'chmod -R 777 .'
                sh 'pwd'
                script {
                    WORK_DIR = sh(returnStdout: true, script: 'pwd')
                    echo "${WORK_DIR}"
                }
            }
        }
        stage('生产镜像') {
            steps {
                sh 'docker build -f Dockerfile -t ${IMAGE_NAME}:${BUILD_NUMBER} ${WORK_DIR}'
                sh 'docker images'
                sh 'docker login -u jecoolee registry.cn-hangzhou.aliyuncs.com'
                sh 'jiezi00000'
                sh 'docker push ${IMAGE_NAME}:${BUILD_NUMBER}'
                sh 'docker rmi ${IMAGE_NAME}:${BUILD_NUMBER}'
                sh 'docker images'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
