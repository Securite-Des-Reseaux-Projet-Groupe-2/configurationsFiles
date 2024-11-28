# Conf t
conf t

# Configuration VLAN
vlan 20
name MED
exit

# Configuration des ports ACCESS

interface range fastEthernet 1/4 - 5
switchport mode access
switchport access vlan 20

# Configuration des pors TRUNK

interface range fastEthernet 1/2 - 3
switchport mode trunk
switchport trunk allowed vlan 20


