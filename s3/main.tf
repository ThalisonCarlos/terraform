

resource "aws_s3_bucket" "this" {
  bucket = "${var.name}"
  acl    = "${var.acl}"

  versioning {
      enabled = "${var.versioning}"
  }

  tags = "${var.tags}"
}

resource "aws_s3_bucket_object" "this" {
  count  = "${var.create_object ? 1 : 0}" 
  bucket = "${aws_s3_bucket.this.id}"
  key    = "${var.object_key}"
  source = "${var.object_source}"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = "${filemd5(var.object_source)}"
}