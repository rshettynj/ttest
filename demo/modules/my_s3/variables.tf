variable "myregions" {
   type = list
   default = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]
}

variable "mybucket1" {
  type        = string
  description = "bucket name"
  default     = "rshetty-serverless-artifacts-900-03"
}

variable "mybucket2" {
  type        = string
  description = "bucket name"
  default     = "rshetty-serverless-artifacts-900-04"
}

variable "testmap" {
   type = map
   default = {"id": "rks", "mom":"snl", "id":"adt"}
}
