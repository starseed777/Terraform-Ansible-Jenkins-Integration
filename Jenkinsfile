pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraformpath()}"
    }
    stages {
      stage("Terraform init and apply - dev") { 
        steps{
           sh "terraform init"

           sh "terraform workspace new dev"
          
        }  
      }  
    }
}

def getterraformpath(){
  def tfHome = tool name: 'terraform', type: 'terraform'
  return tfHome
}