#ec2 instance for web_tier
resource "aws_instance" "web_ec2_vm" {
  count = length(var.availability_zone)
  ami           = var.ami
  instance_type = var.instance
  subnet_id = var.web_tier_subnet[count.index]
  security_groups = [var.web_tier_security_grp]


  tags = {
    Name = "web_tier_instance"
  }
}

#ec2 instance for app_tier
resource "aws_instance" "app_ec2_vm" {
  count = length(var.availability_zone)
  ami           = var.ami
  instance_type = var.instance
  subnet_id = var.app_tier_subnet[count.index]
  security_groups =[var.app_tier_security_grp]


  tags = {
    Name = "app_tier_instance"
  }
}