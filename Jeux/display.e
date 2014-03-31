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
	personnage:PERSONAGE

	make
		local
			error: INTEGER
		do
			error := SDL_Init (SDL_INIT_VIDEO)
			screen := SDL_SetVideoMode (600, 400, 32, SDL_SWSURFACE)
			create_images
		ensure
			screen_not_null: screen /= create {POINTER}
		end

	create_images
		do
			create background.make (screen, "background.bmp", 0, 0)
			create personnage.make (screen, "personnage.bmp", 0, 0)
			create sandbag.make (screen, "personnage.bmp", 200, 0)
		end

	show
		local
			error: INTEGER
		do
			background.blitsurface
			personnage.blitsurface
			sandbag.blitsurface
			error := SDL_Flip (screen)
			SDL_Delay (1)
		end

end
