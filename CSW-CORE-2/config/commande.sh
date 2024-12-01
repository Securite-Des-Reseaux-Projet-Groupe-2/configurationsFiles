conf t

# Configuration EtherChannel
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on
exit

interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
# switchport trunk allowed vlan 20
exit

#configuration fastEthernet 0/0

interface fastEthernet 0/0
ip address 10.1.0.13 255.255.255.252
no shutdown
exit

#configuration fastEthernet 0/1

interface fastEthernet 0/1
ip address 10.1.0.9 255.255.255.252
no shutdown
exit

#configuration fastEthernet 1/2

interface fastEthernet 1/2
no switchport
ip address 10.1.0.21 255.255.255.252
no shutdown
exit

#configuration fastEthernet 1/3

interface fastEthernet 1/3
no switchport
ip address 10.1.0.29 255.255.255.252
no shutdown
exit


#configuration ospf

ip routing
router ospf 1
network 10.1.0.8 0.0.0.3 area 0
network 10.1.0.12 0.0.0.3 area 0
network 10.1.0.20 0.0.0.3 area 0
network 10.1.0.28 0.0.0.3 area 0
exit

end

copy run start
