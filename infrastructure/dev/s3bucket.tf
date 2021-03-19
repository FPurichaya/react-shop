resource "aws_s3_bucket" "website_bucket" {
  bucket = "wesite-bucket1"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}