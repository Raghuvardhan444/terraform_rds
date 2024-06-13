variable "region" {
  description = "The AWS region to deploy in"
  default     = "us-west-2"
}

variable "allocated_storage" {
  description = "The allocated storage size of the DB, in GiB"
  default     = 20
}

variable "engine_version" {
  description = "The version of the database engine"
  default     = "14"
}

variable "instance_class" {
  description = "The instance class of the RDS instance"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database"
  default     = "mydb"
}

variable "username" {
  description = "The username for the database"
  default     = "dbadmin"  # Change this to a non-reserved username
}

variable "password" {
  description = "The password for the database"
  default     = "admin1234"
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group"
  default     = "default.postgres14"
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  default     = true
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot before deleting the DB"
  default     = true
}
