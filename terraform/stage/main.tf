provider "yandex" {
    # token = ""
    service_account_key_file = var.service_account_key_file
    cloud_id = var.cloud_id
    folder_id = var.folder_id
    zone = var.zone
}

module "app" {
  source = "../modules/app"
  public_key_path = var.public_key_path
#   app_disk_image = var.app_disk_image
  app_disk_image = var.app_disk_image
  subnet_id = var.subnet_id
}

module "db" {
  source = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image = var.db_disk_image
  subnet_id = var.subnet_id
}

# module "vpc" {
#   source = "./modules/vpc"
# #   public_key_path = var.public_key_path
# #   db_disk_image = var.db_disk_image
# #   subnet_id = var.subnet_id
# }

resource "yandex_vpc_network" "app-network" {
  name = "reddit-app-network"
}

resource "yandex_vpc_subnet" "app-subnet" {
  name = "reddit-app-subnet"
  zone = "ru-central1-a"
  network_id = "${yandex_vpc_network.app-network.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}
