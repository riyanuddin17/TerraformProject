 resource "aws_db_instance" "myrds" {
    allocated_storage   = "20"
   storage_type        = "gp2"
   identifier          = "rdstf"
   engine              = "mysql"
   engine_version      = "8.0.27"
   instance_class      = "db.t2.micro"
   username            = "admin"
   password            = "Passw0rd!123"
   publicly_accessible = false  # Set to false for private subnet
   skip_final_snapshot = true
   db_subnet_group_name = var.subnet1_id

   tags = {
     Name = "MyRDS"
   }
 }