pipeline {
    agent any
    stages {
      stage("Terraform init and apply - dev") 
        steps{
          sh "terraform workspace new dev"  
          sh "terraform init"
        }  
    }
}

