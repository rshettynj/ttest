locals {
  mylocalbucket1 = "rshetty-serverless-artifacts-700-005"
  mylocalbucket2 = "rshetty-serverless-artifacts-700-006"
}

#myregion comes from root module variables.tf file
provider "aws" {
  region     = var.myregion["east1_region"]
  version    = "~> 2.60"
}

provider "aws" {
  alias      = "ohio"
  region     = var.myregion["east2_region"]
  version    = "~> 2.60"
}

#mybucket1 and mybucket2 comes from root module local definition above
#this is module manifest that refer to a child module called "my_s3.tf"
module "s3_module" {
  source    = "./modules/my_s3"
  /* below code not working to create one bucket in each region,, need some logic here..
  providers = {
    aws = aws.ohio
  }
  */

  mybucket1 = "${local.mylocalbucket1}"
  mybucket2 = "${local.mylocalbucket2}"
}

#output value from child module's output sent here.. standard call is module.<MODULE_NAME>.<OUTPUTNAME>
#MODULE_NAME here is s3_module because s3_module indirectly calls my_s3 using "module" call above.
#OUTPUTNAME is the named outputs in the child output.tf file
output "bucket1arn" {
  value = module.s3_module.mybucket1arn
}

output "bucket2arn" {
  value = module.s3_module.mybucket2arn
}

output "regions_we_use" {
  value = module.s3_module.myregionlistvals
}

#joutput "testing1" {
#  foreach = module.s3_module.testmapout
#  value   = each.value
#}

/*
data "aws_s3_bucket" "get_bucket" {
   bucket     = local.mylocalbucket2
   depends_on = [ module.s3_module.mybucket2arn ]
}
*/
