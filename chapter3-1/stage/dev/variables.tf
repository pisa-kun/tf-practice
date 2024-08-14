variable "project_id" {
  type = string
}

variable "bucket_name" {
  type = string
  default = "sumiri-bucket"
}

variable "region"{
  type = string
  default = "asia-northeast1"
}

variable "db_instance_name" {
  description = "Database instance name"
  type = string
  default = "sample-postgres"
}

variable "db_password" {
  description = "Database user password"
  type = string
  sensitive = true
}

variable "db_username" {
  description = "Database user name"
  type = string
  sensitive = true
}