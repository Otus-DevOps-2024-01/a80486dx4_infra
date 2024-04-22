variable "db_disk_image" {
  description = "Disk image for reddit db"
  default = "reddit-base-mongo-1713692682"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnets for modules"
}
