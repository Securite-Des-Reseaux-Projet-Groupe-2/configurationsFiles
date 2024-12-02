# Conf t
conf t
no ip routing
# Configuration Vlan
vlan 20
name MED
exit

# Configuration des ports ACCESS
interface fastEthernet 1/4 
switchport mode access
switchport access vlan 20
exit

interface range fastEthernet 1/5
switchport mode access
switchport access vlan 20
exit

# Configuration des ports TRUNK

interface fastEthernet 1/2
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
exit

interface fastEthernet 1/3
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
exit

interface vlan 20
ip address 10.1.2.241 255.255.255.0
ip default-gateway 10.1.2.1

end
copy run start