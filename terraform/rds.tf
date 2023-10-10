resource "aws_db_instance" "myrds" {
    allocated_storage   = 10
    db_name = "mydb"
   storage_type        = "gp2"
   engine              = "mysql"
   engine_version      = "5.7"
   instance_class      = "db.t2.micro"
   username            = "admin"
   password            = "passw0rd!123"
   publicly_accessible = true
   skip_final_snapshot = true
   tags = {
     Name = "MyRDS"
   }
 }

 
resource "aws_security_group" "sec_grp_rds" {
  name_prefix = "security group"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name ="sg"
  }
}
resource "aws_security_group_rule" "allow-workers-nodes-communications" {
  description              = "Allow worker nodes to communicate with database"
  from_port                = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sec_grp_rds.id
  source_security_group_id = aws_security_group.allow_tls.id
  to_port                  = 3306
  type                     = "ingress"
}

