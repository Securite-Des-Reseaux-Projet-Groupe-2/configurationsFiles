conf t
ip routing

vlan 10
name SEC
exit

vlan 20
name MED
exit

# Configuration de l'interface VLAN
interface Vlan 20
ip address 10.1.2.253 255.255.255.0
# Configuration HSRP
standby version 2
standby 220 ip 10.1.2.254
standby 220 priority 90
standby 220 preempt
standby 220 name MEDCORE
no shut
exit 

# Configuration de l'interface VLAN
interface Vlan 10
ip address 10.1.1.253 255.255.255.0
# Configuration HSRP
standby version 2
standby 110 ip 10.1.1.254
standby 110 priority 90
standby 110 preempt
standby 110 name SECCORE
no shut
exit 

# Configuration de l'EtherChannel avec CSW-CORE-1
interface range FastEthernet1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode active
exit
interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
exit

# Trunk vers CSW-MED-1 (Distribution Switch)
interface FastEthernet1/5
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
no shutdown
exit

# Trunk vers CSW-SEC-1 (Distribution Switch)
interface FastEthernet1/4
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
no shutdown
exit
