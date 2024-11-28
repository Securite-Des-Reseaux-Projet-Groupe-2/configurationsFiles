# Conf t
conf t

# Configuration VLAN
vlan 20
name MED
exit

# Configuration de l'interface VLAN
interface Vlan 20
ip address 10.1.2.2 255.255.255.0
no shutdown
exit

# Configuration HSRP
interface Vlan 20
standby version 2
standby 10 ip 10.1.2.1
standby 10 priority 100
standby 10 preempt
exit

# Configuration EtherChannel
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dotq1
switchport mode trunk
channel-group 1 mode on

interface Port-channel1
switchport trunk encapsulation dotq1
switchport mode trunk
switchport trunk allowed vlan 20
exit

# Enregistrer les config dans la cache à long terme (sauf les vlans pour l'instant)
exit
copy run start
