# VPC Terraform Module

This VPC setup includes:

#subnets
- Two Public and six private subnets across two Availability Zones.
- Two public subnet for NAT gateway ,each two private subnets at two different zones for frontend(web_tier),backend(app_tier) and  database(data_tier).

#Routing
- Internet Gateway for internet access to the public subnet resources.
- NAT Gateway for private subnet internet access.
- Route tables and associations for proper traffic routing.


#Inputs
NAME                      Description
cidr_block               cidr_block for vpc 
name_prefix              name of the subnets         
availability_zone        zones where subnets are available
public_cidr              public subnets cidr
web_tier                 private subnets cidr for frontend running instances
app_tier                 private subnets cidr for backend running instances   
data_tier                private subnets cidr for database  
enable_gateway           variable to define conditional expression for creating elastic ip and natgateway 
route_cidr               cidr for route table
