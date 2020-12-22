This is documentation of current issue with our jenkins pipeline, we cannot run our ansible playbooks through the pipeline - going to debug and document steps here to a solution.

- First off when instaling ansible with pip3 I had to export it into my path of executibles so I used "export PATH=$PATH:/usr/local/bin/ansible"

- After doing so I went into jenkins global tool configuration and added the path into my ansible plugin as "usr/local/bin" 

- Next I ran the playbook but it kept throwing an error that it could not execute the command "ansible-playbook" so I went into pipeline syntax generator 

- Ansible plugin provided me syntax to invoke a playbook - refer to screenshot to see, so I took this code and wrote out a new function in the Jenkinsfile 

- ok so when running the playbook the ansible-playbook executes but now the playbook itself is throwing errors that I need a sudo password for gathering facts

- so I tweaked the playbook and put "gather_facts: false" to see the behavior and it now throws a new error on the boto3 install task that permission was denied

- error thrown when adding a become true to the boto3 task: 
TASK [Install boto3] ***********************************************************
fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "sudo: a password is required\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1} 


- Ok so after parsing the web for some solutions I found this: https://fuzzyblog.io/blog/ansible/2020/06/03/getting-past-ansible-password-required-issues.html

- Basically jenkins is running these commands as jenkins user so we just have to add jenkins user to the sudoers file!

- VISUDO FILE IS THE SOLUTION TO GET THIS JENKINS JOB SUCCESFULLY WORKING! >> REFER TO SCREENSHOTS EXIT CRITERIA MET
