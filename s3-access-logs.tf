resource "aws_s3_bucket" "b" {
  bucket = "bucket-hat-mpenyana"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "public-read"
}

resource "aws_s3_bucket_acl" "example-clients" {
  bucket   = aws_s3_bucket.clients-b.id
  acl      = "public-read"
  providers = aws.clients
}

resource "aws_s3_bucket" "clients-b" {
  bucket = "bucket-hat-mpenyana-woah"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  provider = aws.clients
}
