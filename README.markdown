# infra-training-ref-infra
Reference implementation for Infra Training

### Pre-Start
1. Ensure your aws credentials and token are set in your local environment.
Ref: https://blog.thoughtworks.net/freddy-escobar/how-to-access-aws-account-with-aws-sso-okta
2. Export a unique team_name env var, this team_name is used to isolate your terraform from others.
```bash
export TF_VAR_team_name=lion
```

### Init, plan and apply
```bash
cd stacks/terralith
terraform init -backend-config="key=${TF_VAR_team_name}/dev/terralith"
terraform apply --var-file=dev.tfvars
```

### Test
1. Ensure you have created and set the K8s context to the EKS Cluster created as part of this project.
These values should be available from the output of the terralith terraform project.
```bash
aws eks update-kubeconfig --region ap-southeast-1 --name <cluster_name> --role-arn <cluster_admin_role_arn>
# aws eks update-kubeconfig --region ap-southeast-1 --name ankit-dev-terralith --role-arn arn:aws:iam::911960542707:role/ankit-dev-terralith-eks-admin
```
2. CD into the test directory and run the tests
```bash
cd tests
go test 
```

