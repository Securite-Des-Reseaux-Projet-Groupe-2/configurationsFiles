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
ip address 10.1.2.252 255.255.255.0
# Configuration HSRP
standby version 2
standby 20 ip 10.1.2.254
standby 20 priority 110
standby 20 preempt
standby 20 name MED
no shut
exit 

# Configuration de l'interface VLAN
interface Vlan 10
ip address 10.1.1.252 255.255.255.0
# Configuration HSRP
standby version 2
standby 10 ip 10.1.1.254
standby 10 priority 110
standby 10 preempt
standby 10 name SEC
no shut
exit 

# Configuration de l'EtherChannel avec CSW-CORE-1
interface range FastEthernet1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on
exit
interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
exit

# Trunk vers CSW-MED-1 (Distribution Switch) .20
interface FastEthernet1/3
no switchport
ip address 10.1.0.21 255.255.255.252
no shutdown
exit

# Trunk vers CSW-SEC-1 (Distribution Switch) .16
interface FastEthernet1/2
no switchport
ip address 10.1.0.17 255.255.255.252
no shutdown
exit

ip routing
router ospf 1
network 10.1.0.20 0.0.0.3 area 0
network 10.1.0.16 0.0.0.3 area 0
exit

end 
wr
