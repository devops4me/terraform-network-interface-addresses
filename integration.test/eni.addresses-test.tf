data aws_caller_identity this {}

module eni-addresses
{
    source      = ".."
    in_vpc_id   = "vpc-0958415a8f36ccd2c"
    in_owner_id = "${ data.aws_caller_identity.this.account_id }"
}

output out_addresses
{
    value = "${ module.eni-addresses.out_eni_addresses }"
}
