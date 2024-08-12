variable "project_id" {
  type = string
}

variable "machine_type" {
  type = string
  default = "n2-standard-2"
}

variable "instance_name" {
  type = string
  default = "kotosaki-instance"
}