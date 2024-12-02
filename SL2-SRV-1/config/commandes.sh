# Configure terminal
conf t
no ip routing

# Configuration VLAN
vlan 30
name SERV
exit

# Configuration des ports ACCESS
interface fastEthernet 1/10
switchport mode access
switchport access vlan 30

interface fastEthernet 1/11
switchport mode access
switchport access vlan 30

# Configuration des pors TRUNK
interface range fastEthernet 1/4
switchport mode trunk
exit

interface range fastEthernet 1/5
switchport mode trunk
exit

interface vlan 30
ip address 10.1.3.241 255.255.255.0
ip default-gateway 10.1.3.1

# Enregistrer les config dans la cache à long terme (sauf les vlans pour l'instant)
exit
copy running-config startup-config