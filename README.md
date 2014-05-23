Kortal_Mombat
================
Version 1.0
23 Mai 2014
Guillaume Boudreau et Philippe Paquette

Kortal Mombat est un jeux d'habileté créer par Guillaume Boudreau et Philippe Paquette
dans le cadre d'un cours de technique informatique au cégep de Drummondville. Le jeux est très simple,
puisqu'il s'agit de lancer des haches sur son opposant et d'éviter celles-ci. Il est possible de contrôler
le personnage de droite en appuyant sur les flèches droite et gauche pour le diriger et le flèche du haut
pour le faire sauter. Pour tirer une hache, il suffit d'appuyer sur la ctrl droit. Pour le personnage de gauche,
les contrôles sont A et D pour aller de gauche à droite, W pour sauter et la barre d'espace pour lancher une hache.

Installez le jeu
----------------------
	
### Installer sur Windows

Décompressez le fichier compressé dans le dossier de votre choix et exécutez.
	
### Installer sur Linux Debian

Décompressez le fichier compressé dans le dossier de votre choix. Vous devrez aussi, en plus d'installer 
le repository, installer les fichiers binaires SDL et SDL_Mixer manuellement par cette commande:

	sudo apt-get install libsdl1.2 libsdl-mixer1.2

Compiler la source du jeu
---------------------

La première chose à faire est de télécharger le repository de Kortal Mombat à l'adresse suivante: 

- [Kortal Mombat][1]

Si vous voulez pouvoir ouvrir et modifier le code, vous aurez besoin de télécharger l'IDE d'EiffelStudio, à l'adresse suivante:

- [EiffelStudio Download][2]

Le téléchargement d'eiffel studio nécessite la création d'un compte sur le site d'eiffel Studio.

### Installer sur Windows
	
	L'installation du repository est la seule chose nécessaire pour travailler sur le code du jeu.
	
### Installer sur Linux Debian

Pour installer sur Linux, vous devrez installer les librairies SDL et SDL_Mixer manuellement par cette commande:

	sudo apt-get install libsdl1.2-dev libsdl-mixer1.2-dev


  [1]: https://github.com/102FTW/Kortal_Mombat.git
  [2]: http://www2.eiffel.com/download/
