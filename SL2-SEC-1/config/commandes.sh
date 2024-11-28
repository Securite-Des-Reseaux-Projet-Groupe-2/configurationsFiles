# Conf t
conf t

# Configuration Vlan
vlan 10
name SEC
exit

# Configuration des ports ACCESS
interface range fastEthernet 1/4 - 5
switchport mode access
switchport access vlan 10
exit

# Configuration des ports TRUNK

interface range fastEthernet 1/2 - 3
switchport mode trunk
switchport trunk allowed vlan 10
exit

ip default-gateway 10.1.1.1

# Enregistrement des config dans la cache à long terme
exit
copy run start
