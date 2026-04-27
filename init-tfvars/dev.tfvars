# These variables are called when running the following command:
# terraform init -backend-config=./init-tfvars/dev.tfvars
bucket         = "aws-s3-crr-remote-state-backend-us-east-2"
key            = "solvd-aws-s3-crr-dev-remote-state-backend.tfstate"
dynamodb_table = "aws-s3-crr-remote-state-backend-us-east-2"
kms_key_id     = "arn:aws:kms:us-east-2:381511845811:key/95a26ae4-a947-469e-b1a4-4dd0fe81a96f"