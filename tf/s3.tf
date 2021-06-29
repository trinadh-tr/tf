resource "aws_s3_bucket" "a205923-thrinadh-codbuild" {
  bucket = "a205923-thrinadh-codbuild"
  acl    = "private"
  tags = local.common_tags
  
}
