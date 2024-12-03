# Conf t
conf t
ip routing
# Configuration VLAN
vlan 20
name MED
exit

# Configuration de l'interface VLAN
interface Vlan 20
ip address 10.1.2.2 255.255.255.0
# Configuration HSRP
standby version 2
standby 20 ip 10.1.2.254
standby 20 priority 90
standby 20 preempt
standby 20 name MED
no shut
exit 

interface fastEthernet 1/2
switchport trunk encapsulation dot1q
switchport mode trunk
exit

#CSWMED1 to CORE1
interface fastEthernet 1/3
no switchport
ip address 10.1.0.22 255.255.255.252
no shutdown
exit

#CSWMED1 to CORE2
interface fastEthernet 1/5
no switchport
ip address 10.1.0.26 255.255.255.252
no shutdown
exit

# Configuration EtherChannel
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on

interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
exit

ip routing
router ospf 1
network 10.1.0.20 0.0.0.3 area 0
network 10.1.0.24 0.0.0.3 area 0
exit

# Enregistrer les config dans la cache à long terme (sauf les vlans pour l'instant)
exit
copy run start
