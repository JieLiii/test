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
                    image "maven:3.6.3-openjdk-8"
                    args "-v /usr/local/maven:/root/.m2 -u root --security-opt seccomp=unconfined"   //maven配置和缓存
                }
            }
            steps {
                sh 'mvn --version'
                sh 'mvn clean package'
                sh 'chmod -R 777 .'
                sh 'pwd'
                script {
                    WORK_DIR = sh(returnStdout: true, script: 'pwd')
                }
            }
        }
        stage('生产镜像') {
            steps {
                sh "docker login -u ${ALIYUN_REGISTRY_USER} -p ${ALIYUN_REGISTRY_PWD} ${ALIYUN_REGISTRY_ADDR}"
                echo "${WORK_DIR}"
                sh "cd ${WORK_DIR}"
                sh "pwd"
                sh "docker build -t ${ALIYUN_REGISTRY_ADDR}/jackinjava/${IMAGE_NAME}:${BUILD_NUMBER} ."
                sh "docker images"
                //sh 'docker push ${ALIYUN_REGISTRY_ADDR}/jackinjava/${IMAGE_NAME}:${BUILD_NUMBER}'
                sh "docker rmi ${ALIYUN_REGISTRY_ADDR}/jackinjava/${IMAGE_NAME}:${BUILD_NUMBER}"
                sh "docker images"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
