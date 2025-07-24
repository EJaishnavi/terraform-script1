resource "aws_s3_bucket" "bucket1" {
bucket = "terraformcode2025"
tags = {
Name = 	"test-bucket"
Environment = "DEV"
}
}
resource "aws_s3_bucket_acl" "bucket1" {
  bucket = aws_s3_bucket.bucket1.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}
