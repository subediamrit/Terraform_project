This configuration creates an internal Application Load Balancer that distributes traffic frontend frontend EC2 to backend EC2 instances inside private subnets.
It includes a target group for backend instances and an HTTP listener on port 3000 to forward incoming requests.

| Resource                                    | Type                      | Description                                                 |
| ------------------------------------------- | ------------------------- | ----------------------------------------------------------- |
| `aws_lb.internal_loadbalancer`              | Application Load Balancer | Internal ALB used to route traffic within the VPC           |
| `aws_lb_target_group.internal_target_group` | Target Group              | Defines backend targets and health check behavior           |
| `aws_lb_listener.internal_http`             | Listener                  | Listens on port 3000 and forwards traffic to the target group |
