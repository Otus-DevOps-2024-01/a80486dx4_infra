data "terraform_remote_state" "remote" {
    backend = "s3"
    config  = {
        endpoint = "https://storage.yandexcloud.net"

        bucket = "reddit"
        region = "ru-central1"
        key    = "remote/reddit.tfstate"

        access_key                  = "YCAJE4nCjM798ylmxQXcUoEmn"
        secret_key                  = "YCMQqX7ER_YK1YmcfgpHHsxBR54Z8XDBlES3cwq4"
        skip_region_validation      = true
        skip_credentials_validation = true
        #skip_requesting_account_id  = true # необходимая опция при описании бэкенда для Terraform версии старше 1.6.1.
    }
}
