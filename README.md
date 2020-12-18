# mak89al_infra
mak89al Infra repository

HW#4.Deploy test app
testapp_IP = 178.154.228.86
testapp_port = 9292

#deploy of test VM instance
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
  --metadata-from-file user-data=./yc_install_scrypt.yaml

HW#3. Yandex.Cloud
# Для подключения к удаленной машине через внешний IP было сделано следующее:
1. на локальной добавлены строки в  файл /ets/hosts:

	bastion_IP = 178.154.246.47
	someinternalhost_IP = 10.130.0.15

2. на машине bastion_VM  добавлены строки в  файл /ets/hosts:
	2.1 10.130.0.15     someinternalhost_VM



3. подключение к someinternalhost_VM с локальной машине одной командой осуществляется следующим образом:
	ssh -A -t appuser@BASTION_VM ssh appuser@SOMEINTERNALHOST_VM
4. для осуществления подключения вида ssh SOMEINTERNALHOST_VM необходимо внести изменения следующего вида  в файл ~/.ssh/config на локальной машине:
    Host someinternalhost_VM
    Hostname 178.154.246.47
    Port 22
    User appuser
    IdentityFile ~/.ssh/appuser.pub
    RequestTTY force
    ForwardAgent yes
    RemoteCommand ssh appuser@SOMEINTERNALHOST_VM

5. Настроен VPN сервер описанный в инструкциию
Исправлена проблема с необходимостью установить iptables на VM.

Доп. задание по добавлению сертификата к вэб ресурсу не выполнено.
