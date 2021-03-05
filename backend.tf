terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "wes-lab-terraform"
        encrypt = "true"
        key = "terraform.tfstate"
    }
}