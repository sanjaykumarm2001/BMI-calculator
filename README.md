
# BMI Calculator Application 

    The BMI Calculator is a simple web application that allows users to calculate their Body Mass Index (BMI) based on their height and weight. This project demonstrates the use of containerization, orchestration, and automation tools for application deployment.

## Prerequisites
Before you begin, ensure you have the following tools installed and configured on your EC2 instance:

- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Docker](https://docs.docker.com/get-docker/)
- [Ansible](https://www.ansible.com/)
- [Jenkins](https://www.jenkins.io/doc/book/installing/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- An active AWS account with EC2 access

##  Work-Flow

    1. Clone the Repository

        Clone the repository using git clone https://github.com/sanjaykumarm2001/BMI-calculator

    2. Copying the files to Ansible server 

    This process involves transferring all files from the Jenkins workspace to the Ansible server, ensuring efficient access for deployment and configuration management.

    3. Build the Docker Image

    To automate the process of building a Docker image and pushing it to Docker Hub by ansible server  

    4. Deploying app on minikube

    The deployment of the application on Minikube is managed using deployment.yaml and service.yaml files, which define the necessary Kubernetes resources. This process is automated through an Ansible playbook, ensuring a streamlined deployment and easy access to the application.

![Screenshot 2024-10-17 160630](https://github.com/user-attachments/assets/6d074e13-4719-4e2c-8f35-6b389f05da71)

     

## Troubleshooting
    *Docker Image Not Building: Ensure the Dockerfile is correct and all required files are present.
    *Jenkins Build Failing: Check the Jenkins logs for errors and ensure credentials are properly configured