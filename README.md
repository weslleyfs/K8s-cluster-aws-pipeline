
# K8S Single Cluster-aws-pipeline
Este é apenas um projeto utilizado para estudo visando aprender e entender melhor a integracao das ferramentas

## O que esta sendo utilizado?
 - Docker
 - Ansible
 - Terraform
 - Drone CI
 - AWS
 - Kubernetes

## Como funciona?

- Terraform cria 3 instancias na AWS, um Security Group e uma Keypair.
- Ansible instala e configura o Kubernetes.
- Eles trabalham juntos em uma pipeline do https://drone.io, para funcionar se faz necessário criar as chaves dentro das configuracoes do repositorio no Drone CI
- O Drone CI usa um container Docker que foi criado com Terraform e Ansible, a imagem foi disponibilizada no Docker Hub: 'docker pull weslleyf/ansibleandterraform'

## O objetivo
O objetivo é criar um cluster K8S na AWS totalmente automatizado através de pipeline e entender cada passo.

## A Base do projeto

Como trata-se de aprendzado peguei o projeto base do repositorio ( https://github.com/mateusmuller/k8s-cluster-spinup) e estou estudando e aperfeiçoando ele.