resource "aws_iam_role_policy_attachment" "iam-policy" {
    role = aws_iam_role.ec2_full_access_role.id 
    policy_arn =  "arn:aws:iam::aws:policy/AdministratorAccess"
}