variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use for the instance"
  default     = "ami-0abcdef1234567890"  # Replace with your AMI ID
}

variable "key_name" {
  description = "The key name to use for the instance"
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "MyEC2Instance"
  }
}

output "instance_id" {
  value = aws_instance.this.id
}

output "availability_zone" {
  value = aws_instance.this.availability_zone
}
