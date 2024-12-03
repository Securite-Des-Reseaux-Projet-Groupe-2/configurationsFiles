## Documentation brève Configuration CSW-SRV-1

- On définit le VLAN 30 étant le réseau des Serveurs
- On lui attribue l'ip 10.1.3.2 dans le VLAN 30
- On configure les interfaces qui vont vers les Switchs Layer 2 en mode Trunk
- On configure HSRP pour le routeur en lui donnant la première priorité (SW-L3 actif) et en mentionnant l'adresse IP passerelle virtuel 10.1.3.1
- On configure l'Etherchannel sur les 2 interfaces connecté à l'autre Switch Layer 3
- On définit le Port-channel pour l'Etherchannel
