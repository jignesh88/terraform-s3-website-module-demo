resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags = var.tags
  force_destroy = true
}

resource "aws_s3_bucket_object" "objects" {
  bucket = aws_s3_bucket.s3_bucket.id
  for_each = fileset("${path.module}/www","*.html")
  key = each.value
  acl = "public-read"
  source = "${path.module}/www/${each.value}"
  etag = filemd5("${path.module}/www/${each.value}")
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
     key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Sid = "PulicReadGetObject"
      Effect = "Allow"
      Principal = "*"
      Action = "S3:GetObject"
      Resource = [
        aws_s3_bucket.s3_bucket.arn,
        "${aws_s3_bucket.s3_bucket.arn}/*"
      ]
    }]
  })
}