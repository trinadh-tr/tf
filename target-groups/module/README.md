# Target groups terraform module - target group

This module will create AWS Target groups  -   


## Input Variables 
#naming for the service while creation 
* service_name (required) # short name required
* dns_typ (required) #idintificatoin for public or private type  
* health_check_path(required) #should be starts with '/'
* port_number (required)
* required_tags (optional)


*Optional Input Variables are having default values, You can modify those by passing those variables*



## Usage  

### Command Line Trigger 
```
terraform init
terraform validate

#Create workspace based on the environment 
terraform workspace new Dev

# Generate the plan and Verify
terraform plan -var 'service_name=tg' -var 'health_check_path=/anzu/health' -var 'port_number=80' -var 'dns_type=pr'

# Apply the Changes
terraform apply -var 'service_name=tg' -var 'health_check_path=/anzu/health' -var 'port_number=80' -var 'dns_type=pr'   


# To Destroy 
terraform destroy -var 'service_name=tg' -var 'health_check_path=/anzu/health' -var 'port_number=80' -var 'dns_type=pr'

```



### Use as a Module

```
module "ecs-cluster" {
  source = https://github.com/tr/akkadia_terraform-common/target-group/

  name = local.ecs_resource_name
  
  required_tags = local.required_tags
  ......
  .....
  
}
```

