note
	description: "Summary description for {DISPLAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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
			error := SDL_Init (SDL_INIT_VIDEO)
			screen := SDL_SetVideoMode (1263, 548, 32, SDL_SWSURFACE)
			create_images
		ensure
			screen_not_null: screen /= create {POINTER}
		end

	create_images
		do
			create background.make (screen, "background.bmp", 0, 0)
			create personnage.make (screen, "personnage.bmp", 300, 370)
			create personnage2.make (screen, "personnage.bmp",800, 370)
			personnage2.orientation:=2
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
			personnage2.blitsurface
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
