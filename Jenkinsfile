pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraformpath()}"
    }
    stages {
      stage("Terraform init and apply - dev") { 
        steps{

           sh label: "", returnStatus: true, script: 'terraform workspace new dev'

           sh "terraform init"

           sh "terraform apply -var-file=dev.tfvars --auto-approve" 
        }  
      }
      stage("Terraform init and apply - prod") {
        steps{

          sh label: "", returnStatus: true, script: 'terraform workspace new prod'

          sh "terraform init"

          sh "terraform apply -var-file=prod.tfvars --auto-approve"
        }
      }  
    }
}

def getterraformpath(){
  def tfHome = tool name: 'terraform', type: 'terraform'
  return tfHome
}