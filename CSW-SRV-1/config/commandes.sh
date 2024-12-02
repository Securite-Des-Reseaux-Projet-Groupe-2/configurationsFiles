# Configure terminal
conf t
ip routing
# Configuration VLAN
vlan 30
name SRV
exit

# Configuration de l'interface VLAN
interface Vlan 30
ip address 10.1.3.2 255.255.255.0
standby version 2
standby 30 ip 10.1.3.1
standby 30 priority 110
standby 30 preempt
standby 30 name SRV
no shutdown

# Config interfaces vers Switch L2
interface fastEthernet 1/4
switchport trunk encapsulation dot1q
switchport mode trunk
exit

interface fastEthernet 1/5
switchport trunk encapsulation dot1q
switchport mode trunk
exit


# Configuration EtherChannel
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on

interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
exit

# Enregistrer les config dans la cache à long terme (sauf les vlans pour l'instant)
exit
copy running-config startup-config