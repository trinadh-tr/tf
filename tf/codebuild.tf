data "aws_s3_bucket" "s3" {
  bucket = "a205923-thrinadh-temp"
}

resource "aws_codebuild_project" "a205923-u6111359-tf-poc" {
  name          = "a205923-u6111359-tf-poc"
  description   = "test_codebuild_project"
  service_role  = aws_iam_role.a205923-tf-poc-codebuild.arn
  tags = local.common_tags

# artifacts {
#   type = "S3"
#   location = "${aws_s3_bucket.a205923-thrinadh-codbuild.id}"
# }
#

 artifacts {
    type = "S3"
    location = "${aws_s3_bucket.a205923-thrinadh-codbuild.id}"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode = true
  }
  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${aws_s3_bucket.a205923-thrinadh-codbuild.id}/build-log"
    }
  }


 source {
     type   = "S3"
     location = "${data.aws_s3_bucket.s3.id}/anzu/"
 }
}
#
#source {
#  type = "NO_SOURCE"
#  buildspec   = "./buildspec.yml"
#}
#}
# source {
# type            = "GITHUB"
# location        = "https://github.com/trinadh-tr/tf.git"
# git_clone_depth = 1
#
# git_submodules_config {
#   fetch_submodules = true
#  }
#
# }
#}



#################################################
/*
source {

    buildspec           = var.buildspec
    type                = var.source_type
    location            = var.source_location
    report_build_status = var.report_build_status
    git_clone_depth     = var.git_clone_depth != null ? var.git_clone_depth : null

    dynamic "auth" {
      for_each = var.private_repository ? [""] : []
      content {
        type     = "OAUTH"
        resource = join("", aws_codebuild_source_credential.authorization.*.id)
      }
    }

  */
    

  

  
 # tags = local.common_tags
#
