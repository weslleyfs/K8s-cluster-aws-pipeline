variable "amis" {
  type = map
  default = {
      "us-east-1" = "ami-04505e74c0741db8d" # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type Free Tier elegible
  }
}