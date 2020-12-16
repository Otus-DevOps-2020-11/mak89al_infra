# mak89al_infra
mak89al Infra repository
HW#3. Yandex.Cloud
# Для подключения к удаленной машине через внешний IP было сделано следующее:
1. на локальной добавлены строки в  файл /ets/hosts:
	1.1 178.154.246.47  bastion_VM
	1.2 10.130.0.15     someinternalhost_VM
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
