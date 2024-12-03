# Conf t
conf t
ip routing
# Configuration VLAN
vlan 20
name MED
exit

# Configuration de l'interface VLAN
interface Vlan 20
ip address 10.1.2.3 255.255.255.0
# Configuration HSRP
standby version 2
standby 20 ip 10.1.2.254
standby 20 priority 80
standby 20 preempt
standby 20 name MED
no shut
exit 

interface fastEthernet 1/3
switchport trunk encapsulation dot1q
switchport mode trunk
exit

interface FastEthernet1/5 .48
no switchport
ip address 10.1.0.50 255.255.255.252
no shutdown
exit

interface FastEthernet1/6 .44
no switchport
ip address 10.1.0.46 255.255.255.252
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
network 10.1.2.0 0.0.0.255 area 0
network 10.1.0.44 0.0.0.3 area 0
network 10.1.0.48 0.0.0.3 area 0
exit

exit
copy run start
