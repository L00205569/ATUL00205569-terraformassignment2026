# Sentinel evidence

`sentinel-test-output.txt` contains the full test output. `sentinel-test-results.json` contains the same results in JSON. The `compliant/` and `non-compliant/` folders contain the eight Sentinel screenshots and matching text logs.

In a compliant test, the policy's `main` rule returns `true`. In a non-compliant test, it returns `false`. Both tests report `PASS` when the result is expected.

`terraform-plan.txt` shows the plan that was applied: nine resources to add, with no updates or deletes. `terraform-apply.txt` shows that the apply succeeded.

Run the following commands from the `sentinel/` folder to show each test:

| Case | Command from `sentinel/` | Save as |
| --- | --- | --- |
| Ireland compliant | `sentinel test -verbose -run='aws_ireland_region_restriction/\x2fpass\.hcl$'` | `compliant/01-ireland-region.png` |
| Ireland non-compliant | `sentinel test -verbose -run='aws_ireland_region_restriction/\x2ffail\.hcl$'` | `non-compliant/01-ireland-region.png` |
| S3 compliant | `sentinel test -verbose -run='aws_s3_encryption_public_access/\x2fpass\.hcl$'` | `compliant/02-s3-security.png` |
| S3 non-compliant | `sentinel test -verbose -run='aws_s3_encryption_public_access/\x2ffail\.hcl$'` | `non-compliant/02-s3-security.png` |
| EC2 compliant | `sentinel test -verbose -run='aws_ec2_metadata_ssh_security/\x2fpass\.hcl$'` | `compliant/03-ec2-security.png` |
| EC2 non-compliant | `sentinel test -verbose -run='aws_ec2_metadata_ssh_security/\x2ffail\.hcl$'` | `non-compliant/03-ec2-security.png` |
| Supply chain compliant | `sentinel test -verbose -run='terraform_provider_source_version/\x2fpass\.hcl$'` | `compliant/04-supply-chain.png` |
| Supply chain non-compliant | `sentinel test -verbose -run='terraform_provider_source_version/\x2ffail\.hcl$'` | `non-compliant/04-supply-chain.png` |

The full test output also includes extra rejection tests for individual S3, EC2, provider, and module rules. The eight screenshots above cover the assignment's four compliant and four non-compliant cases.
