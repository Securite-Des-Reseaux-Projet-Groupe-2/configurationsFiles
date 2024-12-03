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

# Trunk vers CSW-MED-1 (Distribution Switch) .20
interface FastEthernet1/3
no switchport
ip address 10.1.0.21 255.255.255.252
no shutdown
exit

# Trunk vers CSW-SEC-1 (Distribution Switch) .16
interface FastEthernet1/2 .16
no switchport
ip address 10.1.0.17 255.255.255.252
no shutdown
exit
interface FastEthernet1/4 .40
no switchport
ip address 10.1.0.41 255.255.255.252
no shutdown
exit

interface FastEthernet1/5 .48
no switchport
ip address 10.1.0.49 255.255.255.252
no shutdown
exit

interface FastEthernet1/6 .32
no switchport
ip address 10.1.0.33 255.255.255.252
no shutdown
exit

interface FastEthernet1/7 .36
no switchport
ip address 10.1.0.37 255.255.255.252
no shutdown
exit

ip routing
router ospf 1
network 10.1.0.20 0.0.0.3 area 0
network 10.1.0.16 0.0.0.3 area 0
network 10.1.0.36 0.0.0.3 area 0
network 10.1.0.32 0.0.0.3 area 0
network 10.1.0.40 0.0.0.3 area 0
network 10.1.0.49 0.0.0.3 area 0
exit

end 
wr
