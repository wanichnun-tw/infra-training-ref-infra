# infra-training-ref-infra
Reference implementation for Infra Training

## Bootstrapping 
1. Ensure aws credentials and token are set in your local environment. 
Ref: https://blog.thoughtworks.net/freddy-escobar/how-to-access-aws-account-with-aws-sso-okta
2. Update the S3_BUCKET and AWS_DEFAULT_REGION vars to the desired values and run `script/init-state-s3.sh`
```bash
S3_BUCKET=my-state-bucket AWS_DEFAULT_REGION=ap-southeast-1 bash scripts/init-state-s3.sh
```

