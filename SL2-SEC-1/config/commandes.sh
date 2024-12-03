# Conf t
conf t
no ip routing
# Configuration Vlan
vlan 10
name SEC
exit

# Configuration des ports ACCESS
interface fastEthernet 1/4 
switchport mode access
switchport access vlan 10
no shut
exit

interface range fastEthernet 1/5
switchport mode access
switchport access vlan 10
no shut
exit

# Configuration des ports TRUNK

interface fastEthernet 1/2
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
no shut
exit

interface fastEthernet 1/3
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
no shut
exit

interface vlan 10
ip address 10.1.1.241 255.255.255.0
no shut
exit

ip default-gateway 10.1.1.254

#ajouter spanning-tree

end
copy run start
