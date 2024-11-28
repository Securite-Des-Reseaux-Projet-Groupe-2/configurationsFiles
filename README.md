# configurationsFiles

## Configuration pour **CSW-MED-1** :

### Configuration du VLAN

```
configure terminal
vlan 10
name MED

```

### Configuration de l'interface VLAN

```

interface Vlan10
ip address 10.1.1.2 255.255.255.0
no shutdown

```

### Configuration HSRP

```

interface Vlan10
standby version 2
standby 10 ip 10.1.1.1
standby 10 priority 100
standby 10 preempt

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

```

## Configuration pour **CSW-SEC-2** :

### Configuration du VLAN

```

configure terminal
vlan 10
name SEC

```

### Configuration de l'interface VLAN

```

interface Vlan10
ip address 10.1.1.3 255.255.255.0
no shutdown

```

### Configuration HSRP

```

standby version 2
standby 10 ip 10.1.1.1
standby 10 priority 110
standby 10 preempt

```


### Configuration EtherChannel (Ports vers CSW-SEC-1)

```

interface range fastEthernet 1/0 - 1
switchport trunk encaplulation dotq1
switchport mode trunk
channel-group 1 mode on


interface Port-channel1
switchport trunk encaplulation dotq1
switchport mode trunk
switchport trunk allowed vlan 10

```



---

## 2. **Configuration du Switch SL2-SEC-1**


### Configuration du VLAN

```

configure terminal
vlan 10
name SEC

```

### Configuration des ports access

```

interface range fastEthernet 1/4 - 5
switchport mode access
switchport access vlan 10

```

### Configuration des ports trunk (vers CSW-SEC-1 et CSW-SEC-2)

```

interface range fastEthernet 1/2 - 3
switchport mode trunk
switchport trunk allowed vlan 10

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
