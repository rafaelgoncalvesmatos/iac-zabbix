#!/bin/bash -e

# Destroi todo ambiente
vagrant destroy -f

# Cria ambiente de acordo com as definicoes Vagrantfile
vagrant up

cd ansible-zabbix

# Executa playbook realizando check
ansible-playbook --syntax-check -vv ansible-zabbix-server.yml

# Executando o playbook para aplicacao da automacao
ansible-playbook -vv ansible-zabbix-server.yml

# Verificar a indepotencia das roles
ansible-playbook -vv ansible-zabbix-server.yml

cd ..

# Destruindo ambiente
vagrant destroy -f

