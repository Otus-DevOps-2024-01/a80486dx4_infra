# a80486dx4_infra

### Add PR template

### 5.1. Подключение с хостам через бастион-хост

Для подключения используется расширение Remote-SSH редактора VS Code.

1. Настройка подключения к хосту **bastion**:
```
Host OTUS-bastion-appuser
    HostName <bastion-public-ip-address>
    User appuser
    IdentityFile C:\Users\<user-name>\.ssh\id_rsa.ppk
```
С помощью этой настройки можно напрямую подключиться к хосту **bastion**.
vs-code-server будет установлен автоматически.

2. Настройка подключения к хосту **someinternalhost** через хост **bastion**:
```
Host OTUS-someinternalhost-appuser
    HostName <someinternalhost-private-ip-address>
    User appuser
    IdentityFile C:\Users\<user-name>\.ssh\id_rsa.ppk
    ProxyCommand ssh -q -W %h:%p OTUS-bastion-appuser
```
- `<bastion-public-ip-address>` - например, 158.160.38.126
- `<someinternalhost-private-ip-address>` - например, 10.128.0.25 из пула адресов Яндекс

### 5.2. Создание VPN-сервера для YC

Данные для подключения:
bastion_IP = 158.160.40.175
someinternalhost_IP = 10.128.0.28

### 5.3. Установка сертификатов для Pritunl

Вход в Pritunl: `https://158.160.40.175.nip.io`

Остановка сервиса:
1. `systemctl stop pritunl`

Получение сертификатов:
1. `sudo certbot certonly --standalone --preferred-challenges http -d 158.160.40.175.nip.io`

Команды установки сертификатов:
1. `pritunl set app.server_cert "$(cat /path/to/cert.pem)"`
2. `pritunl set app.server_key "$(cat /path/to/privkey.pem)"`

Запуск сервиса:
1. `systemctl start pritunl`

### 6.1. Деплой тестовго приложения

testapp_IP = 130.193.51.105
testapp_port = 9292
