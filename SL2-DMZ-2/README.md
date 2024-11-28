```
configure terminal
!
!Création du VLAN
vlan 100
name DMZ
no shut
exit
!
!Configuration des ports access pour les serveurs
interface range fastEthernet 1/4
switchport mode access
switchport access vlan 100
no shut
exit
!
!Configuration des trunks vers les switches L3
interface range fastEthernet 1/2 - 3
switchport mode trunk
switchport trunk allowed vlan 1-2,100,1002-1005
no shut
exit
!
!pas obligatoire mais utile pour débug
int vlan100
ip address 10.100.0.242 255.255.255.0
no shut
exit
!
ip default-gateway 10.100.0.1
!
!Spanning Tree pour le VLAN 100
spanning-tree vlan 100 priority 32768
!
end
copy running-config startup-config
```
