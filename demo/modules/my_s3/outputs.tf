output "mybucket1arn" {
  value = upper(aws_s3_bucket.mybucket1call.arn)
}

output "mybucket2arn" {
  value = aws_s3_bucket.mybucket2call.arn
}

output "myregionlistvals" {
  value =  [ for i in var.myregions: i if substr(i,"3","4") != "west" ]
}

output "testing1" {
  value = replace("roshanshetty", "roshan", "sonal")
  #value =  substr("roshanshetty","2","4")
}

output "testmapout" {
  #value =  [ for i,j in var.testmap: "${i}-${j}" ]

  #Splat example below
  value =  var.myregions[*]

  #value =  { for i,j in var.testmap: i => "${i}-${j}"... }
  #value =  var.testmap[*].id

}
