
####### ############################################# ########
######## Variables for the Terraform [[enis]] module. ########
######## ############################################ ########

### ###################### ###
### [[variable]] in_vpc_id ###
### ###################### ###

variable in_vpc_id
{
    description = "The VPC that contains the relevant network interfaces."
}


### ######################## ###
### [[variable]] in_owner_id ###
### ######################## ###

variable in_owner_id
{
    description = "The id of the requester to filter on also known from the AWS console as attachment owner."
    default = "amazon-rds"
}


### ################################# ###
### [[variable]] in_dependency_holder ###
### ################################# ###

variable in_dependency_holder
{
    description = "Pass something here to prevent this module starting before another finishes."
    default = ""
}
