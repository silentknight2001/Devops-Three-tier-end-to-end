resource "aws_iam_role" "ec2_full_access_role" {
  name        = "ec2-full-access-role"
  description = "IAM role for EC2 instances with full access"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
