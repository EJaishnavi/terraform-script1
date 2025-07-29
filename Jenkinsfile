pipeline{
agent any
tools {
      terraform 'terraform-1.7.1'  // Matches the name in Global Tool Config
    }
environment{
AWS_ACCESS_KEY_ID   = credentials('access_key')
AWS_SECRET_ACCESS_KEY = credentials('secret_key')
}
stages
{
  stage('formate check')
  {
    steps{
      sh 'terraform fmt'
    }
  }
stage('terraform init')
{
steps{
sh 'terraform init'
}
}
stage('terraform plan')
{
steps{ 
sh 'terraform plan'
}
}
stage('terraform apply')
{
steps{
 sh 'terraform apply --auto-approve'
}
}
}
}
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'terraform-automation:latest'  // Use your custom image name
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')      // Secret Text ID in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')  // Secret Text ID in Jenkins
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/EJaishnavi/terraform-script1.git'  // Replace with your repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Terraform in Docker') {
            steps {
                script {
                    sh """
                        docker run --rm \
                        -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
                        -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
                        -v \$(pwd):/app -w /app \
                        ${IMAGE_NAME}
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
        }
    }
}
