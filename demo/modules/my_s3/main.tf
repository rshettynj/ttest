locals {
  #total_regions is created a local variable that takes the value of variable var.myregions's length. We are not able to use it directly in the expression for bucket creation below so created a local variable here..
  total_regions = length(var.myregions)

 my_common_tags = {
  purpose     = "testing"
  owner       = "rshetty"
  priority    = 0
  Environment = var.mybucket1
  modulepath  = path.module
  rootpath    = path.root
  cwd         = path.cwd
  workspace   = terraform.workspace
 }
}

resource "aws_s3_bucket" "mybucket1call" {
  bucket   = "${var.mybucket1}-${local.total_regions}"
  acl      = "private"
  tags     = local.my_common_tags

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "mybucket2call" {
  bucket = var.mybucket2
  acl    = "private"
  tags   = local.my_common_tags
 
  versioning {
    enabled = false
  }
}
