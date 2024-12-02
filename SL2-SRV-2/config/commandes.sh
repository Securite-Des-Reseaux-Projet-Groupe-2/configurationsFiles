# Configure terminal
conf t
no ip routing

# Configuration VLAN
vlan 30
name SERV
exit

# Configuration des ports ACCESS
interface range fastEthernet 1/10 - 11
switchport mode access
switchport access vlan 30

# Configuration des pors TRUNK
interface range fastEthernet 1/4 - 5
switchport mode trunk
exit

# Configuration default-gateway
ip default-gateway 10.1.3.1

# Enregistrer les config dans la cache à long terme (sauf les vlans pour l'instant)
exit
copy running-config startup-config