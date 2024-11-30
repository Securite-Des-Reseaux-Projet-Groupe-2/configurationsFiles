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
# switchport trunk allowed vlan 20
exit

# Configuration default-gateway

ip default-gateway 10.1.2.1

# Enregistrer les config dans la cache à long terme (sauf les vlans pour l'instant)
exit
copy run start


