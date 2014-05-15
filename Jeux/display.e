note
	description: "Cette classe permet d'afficher les images sur l'�cran"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	DISPLAY

inherit

	SDL_WRAPPER

create
	make
feature{NONE} -- initialisation
	make
		local
			l_error: INTEGER
		do
			l_error := SDL_Init (SDL_INIT_VIDEO | SDL_INIT_AUDIO) -- Initialise notre SDL avec le video et l'audio
			screen := SDL_SetVideoMode (1263, 548, 32, SDL_SWSURFACE) -- Cr�e notre �cran avec une r�solution de 1263x548
			create_images
		ensure
			screen_not_null: screen /= create {POINTER} -- S'assure que notre screen n'est pas nul
		end

feature

	screen: POINTER -- Objet �cran utilis� dans la librairie SDL

	background: IMAGE -- Objet de type image qui contient notre arri�re plan

	personnage: PERSONAGE -- Objet de type personage qui est notre personnage

	personnage2: PERSONAGE -- Objet de type personage qui est notre personnage2

	projectile1: PROJECTILE -- Objet de type projectile qui est notre projectile

	projectile2: PROJECTILE -- Objet de type projectile qui est notre projectile2

	create_images
		do
			create background.make (screen, "background.bmp", 0, 0) -- Cr�e notre arri�re plan
			create personnage.make (screen, "personnage.bmp", 800, 370, 1) -- Cr�e notre personnage1
			create personnage2.make (screen, "boromir.bmp", 300, 370, 2) -- Cr�e notre pesronage2
			personnage.orientation := 2 -- Oriente le personange 2 vers a gauche
			create projectile1.make (screen, "projectile.bmp", 0, 0) -- Cr�e notre projectile1
			create projectile2.make (screen, "projectile.bmp", 0, 0) -- Cr�e notre projectile2
		end

	show -- Affiche toutes les images sur notre �crans
		local
			error: INTEGER
		do
			background.blitsurface -- Affiche le fond d'�cran
			personnage.blitsurface -- Affiche le personnage1
			personnage.show_hp -- Affiche la barre de points de vie du personnage1
			personnage2.blitsurface -- Affiche le personnage 2
			personnage2.show_hp -- Affiche la barre de points de vie du personange 2
			if projectile1.spawned then -- Si le projectile 1 est apparu
				projectile1.blitsurface -- Afficher le projectile1
			end
			if projectile2.spawned then -- Si le projectile 2 est apparu
				projectile2.blitsurface -- Afficher le projectile 2
			end
			error := SDL_Flip (screen) -- Flip l'�cran
			SDL_Delay (1) -- Ajoute du delay pour
		end

end
