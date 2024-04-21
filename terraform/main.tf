provider "yandex" {
    # token = ""
    service_account_key_file = var.service_account_key_file
    cloud_id = var.cloud_id
    folder_id = var.folder_id
    zone = var.zone
}

resource "yandex_compute_instance" "app" {
    name = "reddit-app"

    resources {
        cores = 2
        memory = 2
    }
    boot_disk {
        initialize_params {
            # здесь id образа из предыдущего задания
            image_id = var.image_id
        }
    }
    network_interface {
        # id подсети default-ru-central1-a
        subnet_id = var.subnet_id
        nat = true
    }

    provisioner "file" {
      source = "files/puma.service"
      destination = "/tmp/puma.service"
    }

    provisioner "remote-exec" {
      script = "files/deploy.sh"
    }

    connection {
      type = "ssh"
      host = yandex_compute_instance.app.network_interface.0.nat_ip_address
      user = "ubuntu"
      agent = false
    #   путь к приватному ключу
      private_key = file(var.private_key_path)
    }

    metadata = {
        ssh-keys = "ubuntu:${file(var.public_key_path)}"
    }
}

resource "yandex_vpc_network" "app-network" {
  name = "reddit-app-network"
}

resource "yandex_vpc_subnet" "app-subnet" {
  name = "reddit-app-subnet"
  zone = "ru-central1-a"
  network_id = "${yandex_vpc_network.app-network.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}
