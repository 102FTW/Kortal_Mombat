note
	description: "Cette classe permet d'afficher les images sur l'écran"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"
class
	DISPLAY

inherit

	SDL_WRAPPER

create
	make

feature

	screen: POINTER

	background, sandbag: IMAGE
	personnage,personnage2:PERSONAGE
	projectile1,projectile2:PROJECTILE

	make
		local
			error: INTEGER
		do
			error := SDL_Init (SDL_INIT_VIDEO | SDL_INIT_AUDIO)
			screen := SDL_SetVideoMode (1263, 548, 32, SDL_SWSURFACE)
			create_images
		ensure
			screen_not_null: screen /= create {POINTER}
		end

	create_images
		do
			create background.make (screen, "background.bmp", 0, 0)
			create personnage.make (screen, "personnage.bmp", 800, 370,1)
			create personnage2.make (screen, "boromir.bmp",300, 370,2)
			personnage.orientation:=2
			create sandbag.make (screen, "personnage.bmp", 200, 0)
			create projectile1.make(screen, "projectile.bmp",0,0)
			create projectile2.make(screen, "projectile.bmp",0,0)
		end

	show
		local
			error: INTEGER
		do
			background.blitsurface
			personnage.blitsurface
			personnage.show_hp
			personnage2.blitsurface
				personnage2.blitsurface
			personnage2.show_hp
			if projectile1.spawned then
				projectile1.blitsurface
			end
			if projectile2.spawned then
				projectile2.blitsurface
			end
			error := SDL_Flip (screen)
			SDL_Delay (1)
		end

end
