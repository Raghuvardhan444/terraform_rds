provider "aws" {
  region = var.region
}

resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  publicly_accessible  = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.default.name
  skip_final_snapshot  = var.skip_final_snapshot
}

resource "aws_db_subnet_group" "default" {
  name       = "default-subnet-group"
  subnet_ids = data.aws_subnets.default.ids
  description = "Default subnet group for RDS"
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow PostgreSQL traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
