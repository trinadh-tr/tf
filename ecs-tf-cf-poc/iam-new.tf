
###################################################
resource "aws_iam_role" "a205923-tf-poc-cf" {
  name = "a205923-tf-poc-cf"
  permissions_boundary = "arn:aws:iam::818565325759:policy/tr-permission-boundary"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudformation.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}


resource "aws_iam_role_policy_attachment" "ecs" {
  role       = aws_iam_role.a205923-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.a205923-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}
resource "aws_iam_role_policy_attachment" "s3" {
  role       = aws_iam_role.a205923-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "ect" {
  role       = aws_iam_role.a205923-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudformation" {
  role       = aws_iam_role.a205923-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
}
