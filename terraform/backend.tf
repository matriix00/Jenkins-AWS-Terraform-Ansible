terraform {
  backend "s3" {
    bucket         = "jenkins-tf-ansible-state"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "jenkins-dynamodb-state"
  }
}