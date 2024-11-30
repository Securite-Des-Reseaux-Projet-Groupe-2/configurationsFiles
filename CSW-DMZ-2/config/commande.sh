configure terminal

vlan 100
name DMZ
no shut
exit


interface Vlan 100
ip address 10.100.0.3 255.255.255.0
no shut

standby version 2
standby 100 ip 10.100.0.1
standby 100 priority 90
standby 100 preempt

exit
interface range fastEthernet 1/0 - 1
switchport trunk encapsulation dot1q
switchport mode trunk
channel-group 1 mode on
no shut
exit

interface range fastEthernet 1/2 - 3
switchport trunk encapsulation dot1q
switchport mode trunk
no shut
exit

interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
# switchport trunk allowed vlan 1-2,100,1002-1005
no shut
exit

spanning-tree vlan 100 priority 28672
end
copy running-config startup-config