#terraform {
#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#      version = "3.45.0"
#    }
#  }
#}
#data "aws_iam_role" "a205923-tf-poc-codebuild" {
#  name = "a205923-tf-poc-codebuild"
#  permissions_boundary = "arn:aws:iam::818565325759:policy/tr-permission-boundary"
#
#assume_role_policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Effect": "Allow",
#      "Principal": {
#        "Service": "codebuild.amazonaws.com"
#      },
#      "Action": "sts:AssumeRole"
#    }
#  ]
#}
#EOF
#
# 
#}
#
#resource "aws_iam_policy_attachment" "a205923-tf-poc-codebuild-policy" {
#  role = data.aws_iam_role.a205923-tf-poc-codebuild.id
#  #statement {
#    #actions = ["s3:ListAllMyBuckets","s3:GetBucketLocation"]
#  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
#    
#  #  }
# #statement {
# #   actions = ["codebuild:*"]
# #   resources = ["*"]
# #   }
#
# #statement {
# #   actions = ["ecr:*"]
# #   resources = ["*"]
# #   }
#    
#  
#}
#
#
#
#
#
#