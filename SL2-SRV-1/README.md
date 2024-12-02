## Documentation brève Configuration SL2-SRV-1

- Avant toutes choses on retire le mode routage du Switch Layer 2 pour éviter des éventuels problèmes (sachant que c'est un Switch Layer 3 en réalité)
- On définit le VLAN 30 étant le réseau des Serveurs
- On configure les interfaces qui vont vers les Switchs Layer 3 en mode "Trunk"
- On configure les interfaces connectées au Serveurs en mode "Access"
- On définit la default-gateway étant l'adresse IP virtuel 10.1.3.1
