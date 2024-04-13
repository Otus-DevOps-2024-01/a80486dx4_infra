provider "yandex" {
    # token = ""
    service_account_key_file = "/home/ubuntu/keys/key.json"
    cloud_id = ""
    folder_id = ""
    zone = "ru-central1-a"
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
            image_id = "fd809rgi7iom8t5av18b"
        }
    }
    network_interface {
        # id подсети default-ru-central1-a
        subnet_id = "e9bojkkggs4ad7ecbi2o"
        nat = true
    }

    metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
}
