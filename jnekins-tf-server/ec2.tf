resource "aws_instance" "instance" {
    ami = data.aws_ami.ami.image_id
    instance_type = "t2.large"
    key_name = var.key-name
    subnet_id = aws_subnet.subnet-public.id 
    vpc_security_group_ids = [aws_security_group.sg-group.id]
    iam_instance_profile = aws_iam_instance_profile.instance-profile.name 
    root_block_device {
      volume_size = 30
    }
    user_data = templatefile("./tools-install.sh", {})
    
    tags = {
      name = var.instance-name
    }
}