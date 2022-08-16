# infra-training-ref-infra
Reference implementation for Infra Training


## Setup
1. Ensure your aws credentials and token are set in your local environment.
Ref: https://blog.thoughtworks.net/freddy-escobar/how-to-access-aws-account-with-aws-sso-okta
2. Export a unique team_name env var, this team_name is used to isolate your terraform from others.
```bash
export TF_VAR_team_name=team123
```

## Init
```bash
cd stacks/terralith
terraform init -backend-config="key=${TF_VAR_team_name}/dev/terralith"
```

## Plan & Apply
1. While in the `stacks/terralith directory`
```bash
terraform apply --var-file=dev.tfvars
```
