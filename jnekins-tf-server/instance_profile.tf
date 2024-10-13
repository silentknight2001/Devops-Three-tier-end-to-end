resource "aws_iam_instance_profile" "instance-profile" {
    name = "jenkins-instance-profile"
    role = aws_iam_role.ec2_full_access_role.id 
}