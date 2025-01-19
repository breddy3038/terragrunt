# modules/s3/main.tf
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable encryption (AES-256)
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable logging
  logging {
    target_bucket = "my-log-bucket"
    target_prefix = "log/"
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
