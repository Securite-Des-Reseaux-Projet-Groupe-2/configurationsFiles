conf t

#configuration fastEthernet 0/0

interface fastEthernet 0/0
ip address 10.1.0.1 255.255.255.252
no shutdown
exit

#configuration fastEthernet 0/1

interface fastEthernet 0/1
ip address 10.1.0.5 255.255.255.252
no shutdown
exit

#configuration fastEthernet 1/2

interface fastEthernet 1/2
no switchport
ip address 10.1.0.17 255.255.255.252
no shutdown
exit

#configuration fastEthernet 1/3

interface fastEthernet 1/3
no switchport
ip address 10.1.0.25 255.255.255.252
no shutdown
exit


#configuration ospf

ip routing
router ospf 1
network 10.1.0.0 0.0.0.3 area 0
network 10.1.0.4 0.0.0.3 area 0
network 10.1.0.16 0.0.0.3 area 0
network 10.1.0.24 0.0.0.3 area 0
exit

end

copy run start
