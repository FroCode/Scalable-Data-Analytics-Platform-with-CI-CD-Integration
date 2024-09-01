output "s3_bucket_name" {
  value = module.s3.s3_bucket_name.value
}
output "s3_arn" {
  value = module.users.main_user
}