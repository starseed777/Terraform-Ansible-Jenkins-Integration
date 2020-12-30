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

           sh "terraform workspace select dev"

           sh "ansible-playbook ansixterra.yml" 
        }  
      }
      stage("Terraform init and apply - prod") {
        steps{

          sh "terraform init"

          sh label: "", returnStatus: true, script: 'terraform workspace new prod'

          sh "terraform workspace select prod"

          sh "ansible-playbook ansixterra.yml" 
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

