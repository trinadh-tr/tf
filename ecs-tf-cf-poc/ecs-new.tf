terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.47.0"
    }
  }
}


resource "aws_cloudformation_stack" "a205923-example" {
  iam_role_arn = aws_iam_role.a205923-tf-poc-cf.arn
  depends_on = [aws_iam_role.a205923-ecs-tf-poc-cf,aws_iam_role.a205923-tf-poc-cf]
  #Capabilities.member.1= "CAPABILITY_NAMED_IAM"
  name = "a205923-example"
  capabilities = ["CAPABILITY_NAMED_IAM","CAPABILITY_IAM"]
  parameters = {

   # VpcId = var.vpc_id
   # SubnetID = subnet-04fb6f22f08c38812
  }
  template_body = file("${path.module}/stack.yml")
}