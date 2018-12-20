
#### This module reads elastic network interfaces (ENIs) with an Amazon cloud VPC and returns a list of their private IP addresses using Python's AWS Rest API.

---

# elastic network interfaces | eni ip addresses

Point out the **VPC (id)** and tell this module the **owner id** for the elastic network interfaces you specifically want and it will output their **private IP addresses** using a **[python script](eni-addresses.py)** executed by **Terraform's external data** feature.


**[Read AWS documentation on Network Interfaces.](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-network-interfaces.html)**


---


## Usage

Check that your machine or docker image has python installed ( see integration test ) and ensure your AWS credentials are setup. Provide the VPC ID and the owner ID in the variables below.

Finally put the below HCL code into a file and run **`terraform init`** followed by **`terraform apply -auto-approve`**.

```hcl
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
```

The list of IP addresses will be returned in the **`out_addresses`** variable.


---

### Example Network Interface Owner IDs

| Owner ID              | AWS Cloud Service     | Return Description                               |
|:--------------------- |:--------------------- |:------------------------------------------------ |
| <12 digit account id> | EC2 Instances         | IP addresses of EC2 instances by account owner.  |
| amazon-rds            | Relational Db Service | IP addresses of the database cluster nodes.      |
| amazon-elasticsearch  | Elasticsearch Service | IP addresses of the elasticsearch cluster nodes. |

The owner id is the 12 digit account id when you are interested in the EC2 instances you (and/or your agents) have created.

If using a cloud service like a **RDS database cluster** or **AWS ElasticSearch** the owner id will translate as **`amazon-rds`** and **`amazon-elasticsearch`** respectively.

---
