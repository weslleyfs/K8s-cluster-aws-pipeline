provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "kubernetes-worker" {
  ami           = var.amis["us-east-1"]
  instance_type = "t3.medium"
  key_name = "k8s-key"
  count = 2
  tags = {
    name = "k8s"
    type = "worker"
  }
  security_groups = [aws_security_group.k8s-sg.name]
}

resource "aws_instance" "kubernetes-master" {
  ami           = var.amis["us-east-1"]
  instance_type = "t3.medium"
  key_name = "k8s-key"
  count = 1
  tags = {
    name = "k8s"
    type = "master"
  }
  security_groups = [aws_security_group.k8s-sg.name]
}

