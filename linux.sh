#!/bin/sh

cd `dirname $0`
ansible-playbook -i hosts linux.yml 
