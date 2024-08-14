variable "project_id" {
  type = string
}

variable "region"{
  type = string
  default = "asia-northeast1"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "instance_name" {
  type = string
  default = "kototema-dev"
}

variable "machine_type" {
  type = string
  default = "n2-standard-2"
}