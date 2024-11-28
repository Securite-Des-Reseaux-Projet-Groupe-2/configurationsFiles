# configurationsFiles

## Configuration pour **CSW-SEC-1** :

### Configuration du VLAN

```
configure terminal
vlan 10
name MED
exit

```

### Configuration de l'interface VLAN

```

interface Vlan 10
ip address 10.1.1.2 255.255.255.0
no shutdown
exit
interface fastEthernet 1/2
switchport trunk encaplulation dotq1
switchport mode trunk
exit


```

### Configuration HSRP

```

interface Vlan 10
standby version 2
standby 10 ip 10.1.1.1
standby 10 priority 100
standby 10 preempt
exit

```

### Configuration EtherChannel (Ports vers CSW-SEC-2)

```

interface range fastEthernet 1/0 - 1
switchport trunk encaplulation dotq1
switchport mode trunk
channel-group 1 mode on

interface Port-channel1
switchport trunk encaplulation dotq1
switchport mode trunk
switchport trunk allowed vlan 10
exit

```

## Configuration pour **CSW-SEC-2** :

### Configuration du VLAN

```

configure terminal
vlan 10
name SEC
exit

```

### Configuration de l'interface VLAN 

```

interface Vlan 10
ip address 10.1.1.3 255.255.255.0
no shutdown
exit


interface fastEthernet 1/3
switchport trunk encaplulation dotq1
switchport mode trunk
exit

```

### Configuration HSRP

```
interface vlan 10
standby version 2
standby 10 ip 10.1.1.1
standby 10 priority 110
standby 10 preempt
no shutdown
```



### Configuration EtherChannel (Ports vers CSW-SEC-1)

```

interface range fastEthernet 1/0 - 1
switchport trunk encaplulation dotq1
switchport mode trunk
channel-group 1 mode on
exit


interface Port-channel1
switchport trunk encaplulation dotq1
switchport mode trunk
switchport trunk allowed vlan 10
exit

```



---

## 2. **Configuration du Switch SL2-SEC-1**


### Configuration du VLAN

```

configure terminal
vlan 10
name SEC
exit

```

### Configuration des ports access

```

interface range fastEthernet 1/4 - 5
switchport mode access
switchport access vlan 10
exit

```

### Configuration des ports trunk (vers CSW-SEC-1 et CSW-SEC-2)

```

interface range fastEthernet 1/2 - 3
switchport mode trunk
switchport trunk allowed vlan 10
exit

```


---

## 3. **Configuration des PC (PC-SEC-1 et PC-SEC-2)**

### **PC-SEC-1** :

```

- Adresse IP : 10.1.1.10
- Masque de sous-réseau : 255.255.255.0
- Passerelle : 10.1.1.1

```

### **PC-SEC-2** :

```

- Adresse IP : 10.1.1.11
- Masque de sous-réseau : 255.255.255.0
- Passerelle : 10.1.1.1

```
