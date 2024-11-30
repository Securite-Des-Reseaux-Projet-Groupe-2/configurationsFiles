# Conf t
conf t

# Configuration Vlan
vlan 10
name SEC
exit

# Configuration de l'interface Vlan
interface Vlan 10
ip address 10.1.1.3 255.255.255.0
no shutdown
exit

interface fastEthernet 1/3
switchport trunk encapsulation dot1q
switchport mode trunk
exit

# Configuration HSRP
interface Vlan 10
standby version 2
standby 10 ip 10.1.1.1
standby 10 priority 110
standby 10 preempt
exit

# Configuration EtherChannel
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on

interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 10
exit

# Enregistrement des config dans la cache à long terme
exit
copy run start
