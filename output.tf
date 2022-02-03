output "name" {
  value = [
    for key, item in aws_instance.kubernetes-master :
    "Dns_name = ${item.public_dns} \nPublic_ip = ${item.public_ip} \nPrivate_ip = ${item.private_ip} \nssh -i ~ubuntu/.ssh/sua_chave_rsa ubuntu@${item.public_ip}"
  ]
  description = "Mostra os IPs publicos e privados da maquina criada."
}