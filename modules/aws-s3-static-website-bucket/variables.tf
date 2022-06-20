variable "bucket_name" {
  description = "valid s3 bucket name"
  type = string
  default = "ambitionit-2022-website"
}

variable "folder_name" {
  description = "folder name"
  type = string
}

variable "tags" {
  description = "list of tags"
  type = map(string)
  default = {}
}