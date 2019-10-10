# Criação de Variaveis e Profiles de Terraform

Para utilização de valores recorrentes foi criado a estrutura:

variable "name" {
  default = "value"
}

Foi criado também scripts de ambientes de dev e prod, que podem ser utilizados atraves dos comandos abaixo.

Comando utilizados:

   Executando terraform com profile:
      terraform apply -var-file="dev.tfvars"
      
   Executando terraform setando variavel de ambiente:
      terraform apply -var type="t3.medium"
