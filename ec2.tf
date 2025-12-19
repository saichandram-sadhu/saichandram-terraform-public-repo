data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "nginx_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = file("userdata.sh")

  tags = {
    Name = var.instance_name
  }
}
