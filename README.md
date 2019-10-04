# Terraform Taint
Scripts de Terraform

Nessa aula foi aprendido o comando de terraform taint, no qual marca o recurso criado com uma "mancha" indicando que no proximo
apply o recurso sera recriado.

Comando usado nesse caso:

Marca o recurso para ser recriado:
terraform taint aws_s3_bucket_object.object_s3

Desmarca o recurso para ser recriado:
terraform untaint aws_s3_bucket_object.object_s3

