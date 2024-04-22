variable "app_disk_image" {
  description = "Disk image for reddit db"
  default = "reddit-base-ruby-1713692896"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnets for modules"
}
