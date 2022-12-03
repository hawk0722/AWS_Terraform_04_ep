resource "random_id" "random" {
  byte_length = 4
}

# S3 bucket only
resource "aws_s3_bucket" "s3_buket" {
  bucket = "${var.project}-${var.env}-buket-${random_id.random.hex}"
}
