pipeline{
agent any
  #tools {
   #     terraform 'terraform-1.7.1'  // Matches the name in Global Tool Config
    #}
environment{
ACCESS_KEY = credentials('access_key')
SECRET_KEY = credentials('secret_key')
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
