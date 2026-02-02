This configuration creates an external (internet-facing) Application Load Balancer to handle incoming HTTP traffic from users.
It forwards requests to frontend ec2 targets through a defined target group using an HTTP listener on port 80.

| Resource                                    | Type                      | Description                                                 |
| ------------------------------------------- | ------------------------- | ----------------------------------------------------------- |
| `aws_lb.external_loadbalancer`              | Application Load Balancer | Internet-facing ALB that receives public HTTP traffic       |
| `aws_lb_target_group.external_target_group` | Target Group              | Defines backend instances(i.e frontend EC2) and health routing rules          |
| `aws_lb_listener.external_http`             | Listener                  | Listens on port 80 and forwards traffic to the target group |
