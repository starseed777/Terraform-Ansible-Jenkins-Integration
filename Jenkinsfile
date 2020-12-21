pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraformpath()}"
    }
    stages {
      stage("Terraform init and apply - dev") { 
        steps{
           sh "terraform init"

           sh label: "", sh returnStatus: true, script: 'terraform workspace new dev'

           sh "terraform apply" 
        }  
      }  
    }
}

def getterraformpath(){
  def tfHome = tool name: 'terraform', type: 'terraform'
  return tfHome
}