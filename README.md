Using terraform and ansible together with Jenkins CI/CD integration.

Jenkinsfile >> pipeline stages for our terraform provisioning within our various workspaces + ansible playbook execution.

Ansixterra.yml >> Ansible playbook that runs terraform scripts + provisions a dynamoDB table (using ansible as a provisioner too).

The rest of files are all terraform infrastructure provisioning on AWS - a VPC environment with the necessary networking components. Variable files also included for modularity with the code.

