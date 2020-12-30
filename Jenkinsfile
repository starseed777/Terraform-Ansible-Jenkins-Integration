pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraformpath()}"
    }
    stages{
      stage("s3 create bucket"){
        steps{
          script{
            invokeansi("s3-bucket.yml")

          }
        }
      }
    
      stage("Terraform init and apply - dev") { 
        steps{

           sh "terraform init"

           sh label: "", returnStatus: true, script: 'terraform workspace new dev'

           sh "terraform select workspace dev"

           sh "terraform apply -var-file=dev.tfvars --auto-approve" 
        }  
      }
      stage("Terraform init and apply - prod") {
        steps{

          sh "terraform init"

          sh label: "", returnStatus: true, script: 'terraform workspace new prod'

          sh "terraform select workspace prod"

          sh "terraform apply -var-file=prod.tfvars --auto-approve"
        }
      }  
    } 
}

def getterraformpath(){
  def tfHome = tool name: 'terraform', type: 'terraform'
  return tfHome
}

def invokeansi(playbook){
  ansiblePlaybook become: true, installation: 'ansible', playbook: "${playbook}"
}

