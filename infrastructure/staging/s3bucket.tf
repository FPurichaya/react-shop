locals {
  frontendbuck-website-name = aws_s3_bucket.frontendbuck-website.id
}

resource "aws_s3_bucket" "frontendbuck-website" {
  bucket = "${var.project}-${var.region}-${var.environment}-website-bucket"
  acl    = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"

  }
}

resource "aws_s3_bucket_policy" "website-bucket-policy" {
  bucket = local.frontendbuck-website-name
  policy = data.aws_iam_policy_document.website-bucket-policy.json
}

data "aws_iam_policy_document" "website-bucket-policy" {
  statement {
    sid = "allow-public-access"
    actions = [
    "s3:GetObject"
    ]
    resources = [
    "arn:aws:s3:::${local.frontendbuck-website-name}/*"
    ]
    principals {
      type        = "*"
      identifiers = [ "*" ]
    }
  }
  }