variable "project_id" {
  description = "project id"
  type        = string
  default     = "primeval-splice-423019-c0"
}

variable "default_region" {
  description = "The default region for resources"
  default     = "asia-southeast1"
}

variable "docker_version" {
  description = "docker version"
  type        = string
  default     = "ume"
}
