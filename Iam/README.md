This configuration defines an IAM Role and Instance Profile for EC2 instances.
It allows EC2 to securely access AWS Systems Manager (SSM) for session management and Amazon CloudWatch for logging and monitoring, without using hardcoded credentials.

| Resource                               | Type             | Description                                              |
| -------------------------------------- | ---------------- | -------------------------------------------------------- |
| `aws_iam_role.ec2_role`                | IAM Role         | Allows EC2 instances to assume the role via STS(security token service)          |
| `AmazonSSMManagedInstanceCore`         | Managed Policy   | Enables SSM Session Manager access to EC2                |
| `CloudWatchAgentServerPolicy`          | Managed Policy   | Grants permission to send logs and metrics to CloudWatch |
| `aws_iam_instance_profile.ec2_profile` | Instance Profile | Associates the IAM role with EC2 instances               |
