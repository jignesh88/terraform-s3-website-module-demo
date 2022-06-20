variable "bucket_name" {
  description = "valid s3 bucket name"
  type = string
  default = "ambitionit-2022-website"
}

variable "tags" {
  description = "list of tags"
  type = map(string)
  default = {}
}