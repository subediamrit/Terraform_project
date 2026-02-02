# Generate SSH key pair
resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = tls_private_key.bastion_key.public_key_openssh
}

# Save private key to local file
resource "local_file" "private_key" {
  content         = tls_private_key.bastion_key.private_key_pem
  filename        = "${path.module}/bastion-key.pem"
  file_permission = "0400"
}

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

