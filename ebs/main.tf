variable "availability_zone" {
  description = "The availability zone where the volume will be created"
}

variable "volume_size" {
  description = "The size of the volume in GB"
  default     = 10
}

resource "aws_ebs_volume" "this" {
  availability_zone = var.availability_zone
  size              = var.volume_size

  tags = {
    Name = "MyEBSVolume"
  }
}

output "volume_id" {
  value = aws_ebs_volume.this.id
}
