output "external_ip_address_app" {
    # yandex_compute_intsance.app - инициализация ресурса, указывая его тип и имя
    # network_interface.0.nat_ip_address - атрибуты ресурса
    value = module.app.external_ip_address_app
}
