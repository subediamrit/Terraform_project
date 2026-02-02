output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "public_subnet" {
    value = aws_subnet.public_subnet[*].id
}

output "subnet_id" {
    value = aws_subnet.public_subnet[0].id
}


output "web_tier"{
    value = aws_subnet.web_tier[*].id
}

output "app_tier" {
    value = aws_subnet.app_tier[*].id
}


output "data_tier" {
    value = aws_subnet.data_tier[*].id
}