pipeline {
    agent any
    triggers {
        githubPush()  
    }
    stages {
        stage('Git Checkout') {  
            steps {
                git 'https://github.com/sanjaykumarm2001/BMI-calculator'  
            }
        }
        stage('Ansible Server Login using SSH') {  
            steps {
                sshagent(['Ansible_login1']) {  
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250'
                    sh 'scp -r /var/lib/jenkins/workspace/newly/* ubuntu@172.31.39.250:/home/ubuntu'
                }
            }
        }
        stage('Docker building and tagging') {
            steps {
                sshagent(['Ansible_login1']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "cd /home/ubuntu && sudo docker build -t ${JOB_NAME}:${BUILD_ID} ."'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker tag ${JOB_NAME}:${BUILD_ID} sanjaykumar2001/ansible:${BUILD_ID}"'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker tag ${JOB_NAME}:${BUILD_ID} sanjaykumar2001/ansible:latest"'
                }
            }
        }
        stage('Docker logging and pushing image') {
            steps {
                sshagent(['Ansible_login1']) {
                    withCredentials([string(credentialsId: 'DOCKERHUB_CREDENTIALS', variable: 'dockerhubpwd')]) {
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker login -u sanjaykumar2001 -p ${dockerhubpwd}"'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker push sanjaykumar2001/ansible:${BUILD_ID}"'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker push sanjaykumar2001/ansible:latest"'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker rmi sanjaykumar2001/ansible:${BUILD_ID}"'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker rmi sanjaykumar2001/ansible:latest"'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "sudo docker rmi ${JOB_NAME}:${BUILD_ID}"'
                    }
                }
            }
        }
        stage('Copying files from Ansible to Minikube') {
            steps {
                sshagent(['Ansible_login1']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "scp -r /home/ubuntu/deployment.yaml ubuntu@172.31.36.216:/home/ubuntu/"'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "scp -r /home/ubuntu/service.yaml ubuntu@172.31.36.216:/home/ubuntu/"'
                }
            }
        }
        stage('running ansible playbook'){
            steps{
                sshagent(['Ansible_login1']){
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.39.250 "ansible-playbook /home/ubuntu/ansible.yaml"'
                }

            }
        }
    }
}
