# Configure terminal
conf t

# Configuration VLAN
vlan 30
name SRV
exit

# Configuration de l'interface VLAN
interface Vlan 30
ip address 10.1.3.3 255.255.255.0
no shutdown

# Config interfaces vers Switch L2
interface range fastEthernet 1/4 - 5
switchport trunk encapsulation dot1q
switchport mode trunk
exit

# Configuration HSRP
interface Vlan 30
standby version 2
standby 30 ip 10.1.3.1
standby 30 priority 100
standby 30 preempt
exit

# Configuration EtherChannel
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on

interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
exit

# Enregistrer les config dans la cache à long terme (sauf les vlans pour l'instant)
exit
copy running-config startup-config