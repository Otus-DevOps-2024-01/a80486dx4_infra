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
