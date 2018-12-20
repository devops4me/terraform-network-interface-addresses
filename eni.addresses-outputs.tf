
####### ######################################### ########
######## Output of the [[net.interfaces]] module. ########
####### ######################################### ########

### ############################ ###
### [[output]] out_eni_addresses ###
### ############################ ###

output out_eni_addresses
{
    description = "The IP addresses of active network interfaces within the given VPC and subnets."
    value       = "${ split( ",", data.external.eni-ips.result[ "ip_addresses" ] ) }"
}
