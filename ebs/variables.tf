variable "availability_zone" {
  description = "The availability zone where the volume will be created"
}

variable "volume_size" {
  description = "The size of the volume in GB"
  default     = 10
}
