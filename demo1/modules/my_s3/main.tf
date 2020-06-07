resource "aws_s3_bucket" "mybucket1call" {
  bucket = var.mybucket1
  acl    = "private"
  tags   = {
    Name        = "name"
    Environment = "var.mybucket1"
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "mybucket2call" {
  bucket = var.mybucket2
  acl    = "private"
  tags   = {
    Name        = "name"
    Environment = "var.mybucket2"
  }
  versioning {
    enabled = false
  }
}
