provider "aws" {
  region = "us-east-1" 
}

module "ec2_instance" {
  source        = "./modules/ec2"
  ami           = "ami-0abcdef1234567890" 
  instance_type = "t2.micro"
  key_name      = "testkey"
}

module "ebs_volume" {
  source            = "./modules/ebs"
  availability_zone = module.ec2_instance.availability_zone
  volume_size       = 10
}

resource "aws_volume_attachment" "ebs_volume_attachment" {
  device_name = "/dev/sdf"
  instance_id = module.ec2_instance.instance_id
  volume_id   = module.ebs_volume.volume_id
}
