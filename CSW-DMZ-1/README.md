configure terminal
!
!Création du VLAN
vlan 100
name DMZ
no shut
exit
!
!
!Interface VLAN avec adresse IP et HSRP
interface Vlan 100
ip address 10.100.0.2 255.255.255.0
no shut
!
!Configuration HSRP
standby version 2
standby 100 ip 10.100.0.1
standby 100 priority 100
standby 100 preempt
!
exit
!Configuration EtherChannel (trunks vers CSW-DMZ-2)
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on
no shut
exit
!
interface range fastEthernet 1/2 - 3
switchport trunk encapsulation dot1q
switchport mode trunk
no shut
exit
!
interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,100,1002-1005
no shut
exit
!
!Spanning Tree pour le VLAN 100
spanning-tree vlan 100 priority 24576
end
copy running-config startup-config
