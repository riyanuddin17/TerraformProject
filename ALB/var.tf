variable "vpc_security_group_ids" {
    description = "security group from vpc module"
    type        = set(string)
  
}
variable "subnet1_id" {
  description = "subnet value"
  type        = string
}
variable "subnet2_id" {
  description = "subnet value"
  type        = string
}
variable "vpc_id" {
  description = "vpc"
}
variable "target1_id" {
  description = "tg1"
  type        = string
}
variable "target2_id" {
  description = "tg2"
  type        = string
}