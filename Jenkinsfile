pipeline{
agent any
  
environment{
AWS_ACCESS_KEY_ID   = credentials('access_key')
AWS_ACCESS_KEY_ID = credentials('secret_key')
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
