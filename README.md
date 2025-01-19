# Terragrunt S3 Bucket Setup

This repository provides a modular approach to provisioning an S3 bucket using **Terragrunt**. It follows best practices for state management, security, and reusability across multiple environments.

## Directory Structure

terragrunt/
├── infrastructure
│   ├── prod
│   │   └── terragrunt.hcl
│   ├── staging
│   │   └── terragrunt.hcl
├── modules
│   └── s3
│       └── main.tf
└── terragrunt.hcl

### Key Components:
- **`modules/s3/main.tf`**: Contains the Terraform code to create the S3 bucket, including versioning, encryption, and logging.
- **`infrastructure/{env}/terragrunt.hcl`**: Environment-specific configuration files (e.g., for production and staging) that provide inputs like the bucket name.
- **`terragrunt.hcl`**: Shared configuration file that sets up the Terraform source, backend configuration, and remote state management.

## Setup

### Prerequisites:
1. **Terraform**: Ensure that Terraform is installed on your local machine.
2. **AWS Credentials**: Make sure your AWS credentials are configured, either via environment variables or the AWS credentials file (`~/.aws/credentials`).
3. **DynamoDB Table**: A DynamoDB table for state locking (referred to in `remote_state` configuration).

### Steps:
1. **Clone the repository**:
    ```bash
    git clone https://<>
    cd terragrunt
    ```

2. **Initialize Terragrunt**:
    Initialize Terragrunt for the environment of your choice:
    ```bash
    cd infrastructure/prod
    terragrunt init
    ```

3. **Apply Terraform Configuration**:
    Apply the Terragrunt configuration to provision the S3 bucket:
    ```bash
    terragrunt apply
    ```

4. **Repeat for Other Environments**:
    To apply the configuration for another environment (e.g., `staging`):
    ```bash
    cd ../staging
    terragrunt apply
    ```

## Features

- **Versioning**: S3 bucket versioning is enabled to retain historical versions of objects.
- **Encryption**: Server-side encryption (AES-256) is enabled to secure data at rest.
- **Logging**: Access logging is enabled to capture all requests to the S3 bucket.
- **Remote State Management**: State is stored in a secure, versioned S3 bucket with DynamoDB-based state locking.

## Best Practices Followed

- **Modular Architecture**: The S3 bucket configuration is isolated in its own module (`modules/s3`) for reusability.
- **Security**: The S3 bucket uses encryption for data at rest and enables versioning to safeguard data.
- **Environment-Specific Configuration**: Terragrunt is used to manage multiple environments (e.g., `prod`, `staging`) by specifying different configurations per environment.

## Notes

- Ensure that the `my-terragrunt-state-bucket` and `my-terraform-lock-table` are already created in your AWS account for state management and locking.
- The S3 bucket names used in the `prod` and `staging` environments should be globally unique.

## Troubleshooting

- **State Locking Issues**: If you encounter state locking issues, verify that your DynamoDB table (`my-terraform-lock-table`) is set up correctly for Terraform state locking.
- **Permissions**: Ensure that the AWS IAM user has the necessary permissions to create and manage S3 buckets, DynamoDB tables, and CloudWatch logs.

---

