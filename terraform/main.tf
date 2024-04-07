provider "yandex" {
    # token = ""
    service_account_key_file = file("/root/keys/key.json")
    cloud_id = ""
    folder_id = ""
    zone = "ru-central1-a"
}
