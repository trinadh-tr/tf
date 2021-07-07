resource "aws_iam_role" "a205923-ecs-tf-poc-cf" {
  name = "a205923-ecs-tf-poc-cf"
  permissions_boundary = "arn:aws:iam::818565325759:policy/tr-permission-boundary"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "ecs1" {
  role       = aws_iam_role.a205923-ecs-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudwatch1" {
  role       = aws_iam_role.a205923-ecs-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}
resource "aws_iam_role_policy_attachment" "s31" {
  role       = aws_iam_role.a205923-ecs-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "ect1" {
  role       = aws_iam_role.a205923-ecs-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudformation1" {
  role       = aws_iam_role.a205923-ecs-tf-poc-cf.id
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
}
