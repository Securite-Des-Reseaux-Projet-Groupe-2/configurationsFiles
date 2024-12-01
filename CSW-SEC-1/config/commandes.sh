# Conf t
conf t

# Configuration Vlan
vlan 10
name SEC
exit

# Configuration de l'interface Vlan
interface Vlan 10
ip address 10.1.1.2 255.255.255.0
no shutdown
exit

#configuration fastEthernet 1/2

interface fastEthernet 1/2
switchport trunk encapsulation dot1q
switchport mode trunk
exit

#configuration fastEthernet 0/0

interface fastEthernet 0/0
ip address 10.1.0.2 255.255.255.252
no shutdown
exit

#configuration fastEthernet 0/1

interface fastEthernet 0/1
ip address 10.1.0.10 255.255.255.252
no shutdown
exit


#configuration ospf

ip routing
router ospf 1
network 10.1.0.0 0.0.0.3 area 0
network 10.1.0.8 0.0.0.3 area 0
network 10.1.1.0 0.0.0.255 area 0
passive-interface fastEthernet 1/2
exit


# Configuration HSRP
interface Vlan 10
standby version 2
standby 10 ip 10.1.1.1
standby 10 priority 100
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
# switchport trunk allowed vlan 10
exit

# Enregistrement des config dans la cache à long terme
exit
copy run start
