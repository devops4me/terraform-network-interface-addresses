data aws_caller_identity this {}

module eni-addresses
{
    source      = "github.com/devops4me/terraform-network-interface-addresses"
    in_vpc_id   = "<enter-vpc-id-here>"
    in_owner_id = "${ data.aws_caller_identity.this.account_id }"
}

output out_addresses
{
    value = "${ module.eni-ip-addresses.out_eni_addresses }"
}
