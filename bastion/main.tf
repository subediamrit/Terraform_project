
#create ec2 for bastion
resource "aws_instance" "bastion_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = aws_key_pair.bastion_key.key_name 
}



# Elastic IP for Bastion Host
resource "aws_eip" "bastion" {
  domain = "vpc"
  tags = {
    Name = "eip_bastion"
  }
}
#Elastic ip association to bastion ec2
resource "aws_eip_association" "bastion" {
  instance_id   = aws_instance.bastion_ec2.id
  allocation_id = aws_eip.bastion.id
}

