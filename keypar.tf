resource "aws_key_pair" "k8s-key" {
  key_name   = "k8s-key"
  public_key = "Coloque aqui sua chave publica ex: id_rsa.pub "
}