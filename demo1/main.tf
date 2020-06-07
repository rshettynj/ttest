locals {
  mylocalbucket1 = "rshetty-serverless-artifacts-900-00001"
  mylocalbucket2 = "rshetty-serverless-artifacts-900-00002"
}

#myregion comes from root module variables.tf file
provider "aws" {
  region     = var.myregion
}

#mybucket1 and mybucket2 comes from root module local definition above
#this is module manifest that refer to a child module called "my_s3.tf"
module "s3_module" {
  source    = "./modules/my_s3"

  mybucket1 = local.mylocalbucket1
  mybucket2 = local.mylocalbucket2
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
