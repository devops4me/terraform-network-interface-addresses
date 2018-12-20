#!/usr/bin/env python

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# https://www.devopswiki.co.uk
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# eni-addresses.py

# Important items to note before running this script are

#  [1] - the python (boto3) sdk must be installed
#          $ pip install awscli boto3 -U --ignore-installed six

#  [2] - it pays to give this script execute permissions
#          $ chmod u+x eni-addresses.py

#  [3] - the AWS programmatic IAM credentials must exist
#          either in ~/.aws/credentials and/or ~/.aws/config (linux)
#          or as environment variables
#          or in other alternative ways

#  [3] - you can run this script using either of these commands
#          $ python eni-addresses.py
#          $ ./eni-addresses.py

#  [4] - an invalid syntax error "json.dumps" occurs if python3 used

#  [5] - it expects the VPC ID (string) in the first parameter

#  [6] - it expects requester id (attachment owner) in 2nd parameter

#  [7] - output is JSON formatted CSV string with key "ip_addresses"

# Example Output
# {"ip_addresses": "10.42.1.230,10.42.1.39,10.42.1.139,10.42.0.108"}

import boto3, json, sys, logging

logging.basicConfig( filename = 'eni-addresses.log', level = logging.DEBUG, format='%(asctime)s %(message)s', datefmt='%Y%m%d %I:%M:%S %p' )

logging.info( 'The eni-addresses script has been invoked.' )
logging.info( 'The VPC ID received is [%s] and the eni owner name is [%s]' % ( sys.argv[1], sys.argv[2] ) )
logging.info( 'The url endpoint parameter is ~~ [%s] ~~' % sys.argv[3] )

OUTPUT_VARIABLE_NAME = "ip_addresses"
ENI_STATUS = "in-use"
SEPARATOR_STRING = ","

ip_addresses_list = []

for this_subnet in boto3.resource('ec2').Vpc( sys.argv[1] ).subnets.all():
    for this_network_interface in this_subnet.network_interfaces.all():
        if ( (this_network_interface.status == ENI_STATUS ) and ( this_network_interface.requester_id == sys.argv[2] ) ):
            ip_addresses_list.append( this_network_interface.private_ip_address )

ip_addresses_str = SEPARATOR_STRING.join( ip_addresses_list )
print json.dumps( { OUTPUT_VARIABLE_NAME : ip_addresses_str } )
