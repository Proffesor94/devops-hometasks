variable "app_port" {
  default = 80
}
variable "image_name" {}
variable "replicas_count" {}
variable "container_name" {}
variable "app_name" {}
variable "service_name" {}
variable "deployment_name" {}
variable "token" {}
variable "node_port" {}
variable "path" {
  default = "/vagrant"
}
variable "files" {
  default = [
    "provider.tf" ,
    "resource_git.tf" ,
    "static_dep.tf" ,
    "terraform.tfvars" ,
    "vars.tf",
    "static_LB.tf"
  ]
  
}