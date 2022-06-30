#!/usr/bin/env bash

S3_BUCKET=${S3_BUCKET:-"infra-training-state-2022"}
AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-"ap-southeast-1"}

if ! aws s3api head-bucket --bucket "$S3_BUCKET" 2>/dev/null ; then
  echo "Bucket ${S3_BUCKET} does not exit"
  echo "creating bucket ..."
  aws s3api create-bucket --bucket "${S3_BUCKET}" --region ${AWS_DEFAULT_REGION} --create-bucket-configuration LocationConstraint=${AWS_DEFAULT_REGION}
  aws s3api put-bucket-versioning --bucket "${S3_BUCKET}" --versioning-configuration Status=Enabled
  aws s3api put-bucket-encryption --bucket "${S3_BUCKET}" --server-side-encryption-configuration '{
  "Rules": [
    {
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }
  ]
}'
else
  echo "Bucket already exists; Skipping creation"
fi
