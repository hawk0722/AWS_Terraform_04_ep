# Terraform Sample
## AWS Resource
This includes of the following resources:
- Virtual private cloud
- Subnets (Public, Private)
- EC2
- Route tables
- IAM Role with AmazonSSMFullAccess, AmazonS3ReadOnlyAccess
- S3
- Gateway Endpoint
- Interface Endpoint

## SystemConfiguration
![SystemConfiguration](/img/SystemConfiguration.svg)

## Route Table
Public Route Table

|  Destination  |  Target  |
| ---- | ---- |
|  10.0.0.0/16  |  local  |

Private Route Table

|  Destination  |  Target  |
| ---- | ---- |
|  10.0.0.0/16  |  local  |
|  S3  |  vpce-XXXX(Gateway Endpoint)  |

## Instructions
Make sure have the [AWS CLI](https://aws.amazon.com/jp/cli/) and [Terraform](https://www.terraform.io/downloads)

1. Update terraform.tfvars with your desired values.

2. Run the following command.

```bash:bash
terraform init
terraform plan
terraform apply
```
3. Run the following commands, After log into EC2 from Session Manager.
```bash:bash
aws s3 ls --region <selected region>
```

## Notes
- The deployment was tested on windows.
