# Demo
![Image](images/jenkins-started.png)



## Pre-requisits:
* Setup account in "AWS" [AWS Console](https://aws.amazon.com/console/)
   then create new user and download credentials in ~/.aws/credentials to use it in terraform.

* Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your local machine.
* Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) on your local machine to be able to run ansible commands.
## Tools Used
<p align="center">
<a href="https://aws.amazon.com/" target="_blank" rel="noreferrer"> 
<img src="images/aws.png" alt="aws" width="90" height="80"/>
</a>
<a href="https://www.terraform.io/" target="_blank" rel="noreferrer">
<img src="images/terraform.png" alt="terraform" width="90" height="80"/>
</a>
<a href="https://www.ansible.com/" target="_blank" rel="noreferrer">
<img src="images/ansible.png" alt="ansible" width="90" height="80"/>
</a> 
<img src="images/arrow2.png" alt="arrow" width="90" height="80"/>
<a href="https://www.jenkins.io/" target="_blank" rel="noreferrer">
<img src="images/jenkins.png" alt="jenkins" width="90" height="80"/>
</a> 
</p>

## :rocket: Get started

### Cloning this project
```bash
$ git clone https://github.com/matriix00/Jenkins-AWS-Terraform-Ansible.git
```

##  Provision  AWS resources with Terraform


* First we should initiate terraform and download needed plugins for our providers as commands below .

```bash
$ terraform init 
```

* Second we should apply our terraform code on cloud provider (AWS).
```bash
$ terraform apply -auto-approve
```
* After creating our infra we need to store our tfstate
So We created aws s3 bucket and Dynamo-db with terraform to store our tfstate in a private safe place with lock strategy to protect from conflict with other users.

**Note:**
> You can see them in " init-backend.tf " file

* Now we will initiate our backend to replace it from local machine to aws s3 bucket.
```bash
$ terraform init 
```
**Note:**
> Don't forget to make myKey.pem file only readable by you running the code below before ssh to your ec2 instance.

```bash
$ chmod 400 myKey.pem 
```
**Note:**

>After building your infrastructure terraform will print out your instance public ip (jenkins-sever-ip), So make sure you will copy and don’t lose it.

##  Provision  AWS ec2 with Ansible

Now we are going to install jenkins on ec2 using ansible-playbook.

- Make sure that you installed amazon aws plugin to detect host automatically without creating inventory (host).  


```bash
$ ansible-galaxy collection install amazon.aws
```
- Now you can run command below to install jenkins 
```bash
ansible-playbook site.yml
```

After configuring your ec2-server Ansible will print out your jenkins administrator password , So make sure you will copy and don’t lose it.
 
Now all you have to do , is to hit ip that you copied before with port 8080 and enter admin password to get started with jenkins.

<img src="images/jenkins-pass.png" alt="terraform" width="850" height="600"/>

### Hopefully I helped you with anything.
## Clean
- Please make sure to Destroy the resources once the testing is over to save the billing.
```bash
$ terraform destroy -auto-approve
```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.