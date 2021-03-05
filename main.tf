provider "aws" {
    profile =                 "default"
    shared_credentials_file = "/home/wferreira/.aws/credentials"
    region =                  "us-east-1"
}

resource "aws_key_pair" "k8s-key" {
  key_name   = "k8s-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdHAkjXyiK1f/x2kzKBJTH05uuovs1oMh9XJMRFvBwV5uxXj5ZJl4B1tOUn6bUv7xdo3fpOAc5KFljAsv5m7wKknvQRJzKzbNwAIwYKpFYDoHQwWTJLd3EUBDc4NIE3KlKAbwymPNyDy1INKyM2hV/AEPNhCTfOKNJ44V8ey426UO074Z0iel70g8eKPz63lLpC82rdC/UdcvE/0kCN7/fX0+asAZnErrzMg6Pq0NRKALKjMjJdGnn6QlVQeLMxcMoacC4kWNtbF55WoMuhkmjarmP0YkiGesKSxMdwHQS57n5nd7keQqs5kMkIYavDbK4hAKPb4jAE0tNYNeHNhFfSJIDANX/h1XpuFUHxDovNFFIXXrKj2Kp4ggcusm5PJBE1NEcxTckS5P2vFbuZcnDN/y3ZBBTXxQ+BA14A50NKgAIDrIvwt3I9N0tk8jWMQG4tplkRNR2SqPUcRJmbs3fE2WTazCd/xOKo4Hy+8W5LFofX0oaW9pK6YMLyo+TFek= wferreira@ni-93651-3"
}

resource "aws_security_group" "k8s-sg" {
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

} 

resource "aws_instance" "kubernetes-worker" {
  ami           = "ami-085925f297f89fce1"
  instance_type = "t3.medium"
  key_name = "k8s-key"
  count = 2
  tags = {
    name = "k8s"
    type = "worker"
  }
  security_groups = ["${aws_security_group.k8s-sg.name}"]
}

resource "aws_instance" "kubernetes-master" {
  ami           = "ami-085925f297f89fce1"
  instance_type = "t3.medium"
  key_name = "k8s-key"
  count = 1
  tags = {
    name = "k8s"
    type = "master"
  }
  security_groups = ["${aws_security_group.k8s-sg.name}"]
}

