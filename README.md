# Irish Digital Sovereignty and Terraform Sentinel

This project uses Terraform to build a small AWS environment. Four Sentinel policies check the plan before deployment.

## How we started the research

We used a prompt like this to set the research direction:

> I am researching how Terraform and HashiCorp Sentinel can help protect digital sovereignty and infrastructure supply chains in AWS. Help me plan the research. Find official AWS and HashiCorp sources on Ireland region use, S3 encryption and public access, EC2 metadata and SSH, and Terraform provider and module sources. Explain what each control does and what it does not cover.


## What the policies check

| Policy | What it checks |
| --- | --- |
| Ireland region | Planned EC2 instances must be in `eu-west-1`. The policy fails if there is no instance to check. |
| S3 security | Buckets must use AES256 or AWS KMS encryption, block public access, and have versioning enabled. ACLs are left disabled. |
| EC2 security | IMDSv2 is required, the root volume is encrypted, and SSH is limited to `192.0.2.0/24` for both IPv4 and IPv6. |
| Supply chain | The AWS provider must come from HashiCorp and use `~> 6.0`. Modules must come from local paths under `./modules/`. |

The active Terraform configuration and its modules are in [`terraform/`](terraform/). The provider lock file records the selected provider version and checksums. The separate top-level `modules/` folder is not used by this configuration.

## Run the tests

Sentinel tests use mock Terraform data. There are 15 cases: four compliant cases and 11 cases that check whether unsafe settings are rejected. In a non-compliant case, `PASS` means the policy correctly rejected the mock.

```bash
cd sentinel
sentinel test -verbose
```

Test output, JSON results, and the eight required case logs are in [`documentation/evidence/`](documentation/evidence/). These tests check the policies locally. They do not show that HCP Terraform blocked a real run; no HCP workspace or policy set is configured.

## Validate Terraform

From the repository root, enter the Terraform folder and run:

```bash
cd terraform
terraform init
terraform validate
terraform fmt -check -recursive
```

The plan that was applied is saved in [`terraform-plan.txt`](documentation/evidence/terraform-plan.txt). It proposed nine additions and no updates or deletes. The apply completed successfully; its output is in [`terraform-apply.txt`](documentation/evidence/terraform-apply.txt). The AWS resources are still active and may cost money. Remove them when you have finished collecting evidence.

The SSH range `192.0.2.0/24` is reserved for documentation. Replace it with an approved network before using this configuration outside the assignment.

## Limits and next steps

Using the Ireland region helps keep this EC2 resource in Ireland, but that alone does not make the setup fully sovereign. Backup locations, who can administer the system, encryption keys, provider operations, laws, and outside services also matter.

Using local modules limits outside dependencies, but it does not prove the code is safe. Review changes, check provider and module sources, scan for known issues, and update versions carefully. For production, connect these policies to HCP Terraform and show that a non-compliant plan is blocked.

## Screenshots

The eight Sentinel screenshots are in `documentation/evidence/compliant/` and `documentation/evidence/non-compliant/`. Retake the two S3 screenshots after the ACL fix. See the evidence README for the plan screenshot instructions.

## Useful links

These official pages explain the topics used in this project:

- [European Commission: Strengthening Europe’s tech sovereignty](https://digital-strategy.ec.europa.eu/en/policies/eu-tech-sovereignty)
- [AWS Regions](https://docs.aws.amazon.com/global-infrastructure/latest/regions/aws-regions.html)
- [S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
- [S3 bucket encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-encryption.html)
- [Require IMDSv2 on EC2 instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html)
- [EC2 security group rules](https://docs.aws.amazon.com/vpc/latest/userguide/security-group-rules.html)
- [Terraform provider requirements](https://developer.hashicorp.com/terraform/language/providers/requirements)
- [Terraform dependency lock file](https://developer.hashicorp.com/terraform/language/files/dependency-lock)
- [Terraform module block and sources](https://developer.hashicorp.com/terraform/language/block/module)
- [Sentinel policy tests](https://developer.hashicorp.com/sentinel/docs/writing/testing)
- [HCP Terraform policy enforcement](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement)
