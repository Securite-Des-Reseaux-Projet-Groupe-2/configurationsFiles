conf t
ip routing

vlan 10
name SEC
exit

vlan 20
name MED
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

# Trunk vers CSW-MED-1 (Distribution Switch) .24
interface FastEthernet1/5
no switchport
ip address 10.1.0.25 255.255.255.252
no shutdown
exit

# Trunk vers CSW-SEC-1 (Distribution Switch) .28
interface FastEthernet1/4
no switchport
ip address 10.1.0.29 255.255.255.252
no shutdown
no shutdown
exit

ip routing
router ospf 1
network 10.1.0.24 0.0.0.3 area 0
network 10.1.0.28 0.0.0.3 area 0
exit

end 
wr