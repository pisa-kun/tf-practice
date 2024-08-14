// NOTE: devとstgのプロジェクトIDは異なるのが推奨
variable "project_id" {
  type = string
}

variable "region"{
  type = string
  default = "asia-northeast1"
}

variable "environment" {
  type = string
  default = "stg"
}

variable "instance_name" {
  type = string
  default = "kototema-stg"
}

// change stg env machine_type
variable "machine_type" {
  type = string
  default = "n2-standard-4"
}