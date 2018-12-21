
/*
 | --
 | -- Call python script (eni-addresses.py) in this module
 | -- to get the list of private IP addresses attached to
 | -- the (ENI) network interfaces within the stated VPC
 | -- and belonging to the stated owner.
 | --
 | -- Examples for the owner id parameter are
 | --
 | --    a) your 12 digit account ID (for ec2 instances)
 | --    b) "amazon-rds" for RDS clustered database nodes
 | --    c) "amazon-elasticsearch" for es domain nodes
 | --
 | -- Without the dependency holder Terraform runs this
 | -- script as soon as it knows the VPC ID which almost
 | -- always is at the very beginning.
 | --
 | -- Passing in the dependency holder makes Terraform
 | -- hold up and wait until dependent services have
 | -- been instantiated.
 | --
*/
data external eni-ips
{
    program =
    [
        "python",
        "${path.module}/eni-addresses.py",
        "${var.in_vpc_id}",
        "${var.in_owner_id}",
        "${var.in_dependency_holder}"
    ]
}
