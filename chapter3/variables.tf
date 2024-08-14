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

variable "machine_type" {
  type = string
  default = "n2-standard-2"
}

variable "instance_name" {
  type = string
  default = "sakiume-instance"
}