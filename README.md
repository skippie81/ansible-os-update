# ansible-os-update
Ansible playbook to update all Unix and Linux hosts you manage.

An playbook to update systems on differend kind of Unix and Linux OS distributions.
Using the native distribution packaging system. Checks for required reboots and execute a reboot.


## Current supported operating system distributions

|System|OS Family| Distributions |Tested Distributions| Tested Arch|
|:----:|:-------:|---------------|--------------------|------------|
|GNU/Linux|Debian| Debian,Ubuntu,... | Debian| amd64,armv6l |
|GNU/Linux|RedHat| RedHat,Centos | Centos | amd64 |
|Unix|FreeBSD| FreeBSD |FreeBSD 11.x | amd64 |
|Unix|Solaris| SmartOS |SmartOS| amd64 |

more distributions can follow

## Usage

- clone this repo
- install ansible
- create ansible inventory
- run ansble-playbook

### Run playbook
```
ansible-playbook main.yml
```
### Custom configuration

see group_vars/all

|Var|Values|Usage|
|---|:----:|-----|
|reboot_host|boolean|reboot host autmatically when needed|
|reboot_timeout|integer|timeout in seconds to wait for host to respond after reboot|
|wait_for_host_after_reboot|boolean|enable wait for host to respond after reboot|
|update_logs|boolean|write update output to logfiles|
|smartos_pkgin_global_zone|boolean|run pkgin update in Solaris derived systems global zone|

## Requirements


### FreeBSD special instructions

for ansible to work on FreeBSD machines be sure to add following host vars in your inventory file or dynamci invenotry
```
ansible_python_interpreter=/usr/local/bin/python
ansible_perl_interpreter=/usr/local/bin/perl5
ansible_bash_interpreter=/usr/local/bin/bash
```

## Note

The play for Solaris family (currently only SmartOS is tested) are global zone aware.
The play for all GNU/Linux systems are LX Zone aware, if running in an LX Brand zone on SmartOS the kernel versions are excluded in reboot chekcs.