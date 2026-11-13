# Technical Report: Irish Digital Sovereignty and Terraform Sentinel

## Implementation

Terraform builds a small AWS environment. Four hard-mandatory Sentinel policies check region, S3 security, EC2 access, and provider and module sources. They require EC2 in Ireland, encrypted and versioned S3 buckets with public access blocked, IMDSv2, encrypted EC2 storage, and restricted SSH.

## Results and limitations

All 15 local Sentinel mock tests pass: four compliant cases and 11 expected rejections. Terraform validation passed, and the corrected configuration created nine AWS resources. These tests use mock data. There is no HCP Terraform workspace or remote policy set, so they do not prove a real unsafe plan would be blocked.

The Ireland region helps with data location, but it does not cover backup locations, administrator access, encryption key control, laws, or provider operations. Using local modules reduces outside dependencies, but does not prove the code is safe. The SSH range `192.0.2.0/24` is reserved for documentation and cannot be used for real access.

## Recommendations

Connect the policies to HCP Terraform and capture a real compliant run and a rejected non-compliant run. Review module changes, check provider and module sources, scan for known issues, and update versions carefully. Before production, choose an approved SSH range and review backup, access, and key arrangements. Remove the AWS resources after collecting evidence to avoid ongoing charges.

