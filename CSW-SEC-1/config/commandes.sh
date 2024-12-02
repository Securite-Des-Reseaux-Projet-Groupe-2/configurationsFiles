# Conf t
conf t
ip routing
# Configuration Vlan
vlan 10
name SEC
exit

# Configuration de l'interface Vlan
interface Vlan 10
ip address 10.1.1.2 255.255.255.0
# Configuration HSRP
standby version 2
standby 10 ip 10.1.1.254
standby 10 priority 110
standby 10 preempt
standby 10 name SEC
no shut
exit

interface fastEthernet 1/2
switchport trunk encapsulation dot1q
switchport mode trunk
exit

#CSWMED2 to CORE1
interface fastEthernet 1/3
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
exit

#CSWMED2 to CORE2
interface fastEthernet 1/4
switchport trunk encapsulation dot1q
switchport mode trunk
switchport trunk allowed vlan 1-2,10,20,30,100,1002-1005
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

# Enregistrement des config dans la cache à long terme
exit
copy run start
