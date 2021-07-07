#terraform {
#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#      version = "3.47.0"
#    }
#  }
#}
#
#
#resource "aws_cloudformation_stack" "a205923-tf-poc-cf" {
#  name = "a205923-tf-cf-poc"
#  iam_role_arn = aws_iam_role.a205923-tf-poc-cf.arn
# template_body = <<STACK
#{
#    "Resources": {
#    "Cluster": {
#    "Type": "AWS::ECS::Cluster",
#    "Properties": {"ClusterName": "deployment-example-cluster" }
#    },
#
#     "ECSService": {
#        "Type": "AWS::ECS::Service",
#        "Properties" : {
#            "Cluster": { "Ref": "ECSCluster" },
#             "DesiredCapacity":{
#                "Type":"Number",
#                 "Default":"1",
#                 "Description":"Number of instances to launch in your ECS cluster."
#                },
#             "MaxSize":{
#                "Type":"Number",
#                 "Default":"1",
#                 "Description":"Maximum number of instances that can be launched in your ECS cluster."
#                },
#            "InstanceType":{
#                 "Description":"EC2 instance type",
#                 "Type":"String",
#                 "Default":"t2.micro",
#                 "AllowedValues":[
#                   "t2.micro",
#                   "t2.small",
#                   "t2.medium",
#                   "t2.large",
#                   "m3.medium",
#                   "m3.large",
#                   "m3.xlarge",
#                   "m3.2xlarge",
#                   "m4.large",
#                   "m4.xlarge",
#                   "m4.2xlarge",
#                   "m4.4xlarge",
#                   "m4.10xlarge",
#                   "c4.large",
#                   "c4.xlarge",
#                   "c4.2xlarge",
#                   "c4.4xlarge",
#                   "c4.8xlarge",
#                   "c3.large",
#                   "c3.xlarge",
#                   "c3.2xlarge",
#                   "c3.4xlarge",
#                   "c3.8xlarge",
#                   "r3.large",
#                   "r3.xlarge",
#                   "r3.2xlarge",
#                   "r3.4xlarge",
#                   "r3.8xlarge",
#                   "i2.xlarge",
#                   "i2.2xlarge",
#                   "i2.4xlarge",
#                   "i2.8xlarge"
#                 ],
#            "ConstraintDescription":"Please choose a valid instance type."
#             },
#            "Mappings":{
#            "AWSRegionToAMI":{
#            "us-east-1": {
#              "AMIID": "ami-09bee01cc997a78a6"
#            }
#            }
#            },
#
#
#
#
#            "VPC" :{
#
#                "VpcID": "!Ref vpc-0f71a5f77d9183ff1"
#
#            },
#            "LogGroup":{
#
#                "Type": "AWS::Logs::LogGroup",
#                "Properties":{"LogGroupName": "deployment-example-log-group"}
#
#            },
#
#
#            "ExecutionRole" : {
#                "Type": "AWS:IAM::Role",
#                "Properties":{
#                  "RoleName": "deployment-example-role"
#                   "arn" : "aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"                                                      
#                   
#            }
#
#                        
#            
#            
#        
#          
#        }
#        
#    }
# }
#}
# 
#STACK
#}