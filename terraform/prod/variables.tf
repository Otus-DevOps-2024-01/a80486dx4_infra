variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default = "ru-central1-a"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key.json"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default = "reddit-base-ruby-1713692896"
}

variable "db_disk_image" {
  description = "Disk image for reddit db"
  default = "reddit-base-mongo-1713692682"
}
