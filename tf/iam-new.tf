terraform {
  required_version = ">= 0.12.6"

  required_providers {
    aws = ">= 3.34"
  }
}
###################################################
resource "aws_iam_role" "a205923-tf-poc-codebuild" {
  name = "a205923-tf-poc-codebuild"
  permissions_boundary = "arn:aws:iam::818565325759:policy/tr-permission-boundary"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}


resource "aws_iam_role_policy_attachment" "ecs" {
  role       = aws_iam_role.a205923-tf-poc-codebuild.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.a205923-tf-poc-codebuild.id
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}
resource "aws_iam_role_policy_attachment" "s3" {
  role       = aws_iam_role.a205923-tf-poc-codebuild.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "ect" {
  role       = aws_iam_role.a205923-tf-poc-codebuild.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}
