output "private_key_path" {
  value       = "${path.module}/bastion-key.pem"
  description = "Path to the bastion private key"
}

output "ssh_command" {
  value       = "ssh -i ${path.module}/bastion-key.pem ec2-user@${aws_eip.bastion.public_ip}"
  description = "SSH command to connect to bastion"
}