
configure terminal

no ip routing

vlan 100
name DMZ
no shut
exit

interface range fastEthernet 1/4
switchport mode access
switchport access vlan 100
no shut
exit

interface range fastEthernet 1/2 - 3
switchport mode trunk
#switchport trunk allowed vlan 1-2,100,1002-1005
no shut
exit

int vlan100
ip address 10.100.0.242 255.255.255.0
no shut
exit

ip default-gateway 10.100.0.1

spanning-tree vlan 100 priority 32768

end
copy running-config startup-config

