pipeline {
    agent any
    environment {
      PATH = "${PATH}:${getterraformpath()}"
    }
    stages{
      stage("s3 create bucket"){
        steps{
          script{
            creates3bucket("jenkyterraformjawnt")

          }
        }
      }
    
      stage("Terraform init and apply - dev") { 
        steps{

           sh "terraform init"

           sh label: "", returnStatus: true, script: 'terraform workspace new dev'

           sh "terraform apply -var-file=dev.tfvars --auto-approve" 
        }  
      }
      stage("Terraform init and apply - prod") {
        steps{

          sh "terraform init"

          sh label: "", returnStatus: true, script: 'terraform workspace new prod'

          sh "terraform apply -var-file=prod.tfvars --auto-approve"
        }
      }  
    } 
}

def getterraformpath(){
  def tfHome = tool name: 'terraform', type: 'terraform'
  return tfHome
}

def creates3bucket(bucketname){
  sh returnStatus: true, script: "aws s3 mb s3://${bucketname} --region us-east-1"
}