resource "aws_iam_role" "CFE_role" {
  
  name = format("%s-CFE_Role-%s", var.prefix, random_id.id.hex)
  assume_role_policy = file("CFE_Role.json")

  tags = {
    Name = format("%s-role-%s", var.prefix, random_id.id.hex)
    }
}

resource "aws_iam_role_policy" "CFE_policy" {
  
  name = format("%s-CFE_Policy-%s", var.prefix, random_id.id.hex)
  role = aws_iam_role.CFE_role.id
  policy = file("CFE_Policy.json")
}

resource "aws_iam_instance_profile" "CFE_profile" {
  
  name = format("%s-CFE_Profile-%s", var.prefix, random_id.id.hex)
  role = aws_iam_role.CFE_role.name
}


  
