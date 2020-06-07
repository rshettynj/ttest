variable "myregion" {
   type     = map
   default  = { east1_region = "us-east-1", east2_region = "us-east-2", west1_region = "us-west-1" }
}

variable "bucket_suffix" {
   type    = number
   default = 007
}

variable "mylist" {
   type    = list
   default = [ 10,20,30,40 ]
}
