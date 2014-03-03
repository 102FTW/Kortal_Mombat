note
	description: "Summary description for {AFFICHAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	AFFICHAGE
inherit
	SDL_WRAPPER
create
	make_affichage
feature
	screen:POINTER
	background,personnage,sandbag:IMAGE
	make_affichage
	local
		error:INTEGER
	do
		error := SDL_Init (SDL_INIT_VIDEO)
		screen := SDL_SetVideoMode (600, 400, 32, SDL_SWSURFACE)
		creation_images
	ensure
		screen_not_null:screen/=create{POINTER}
	end
	creation_images
	do
		create background.make_image(screen,"background.bmp",0,0)
		create personnage.make_image(screen,"personnage.bmp",0,0)
		create sandbag.make_image(screen,"personnage.bmp",200,0)
	end
	afficher
	local
		error:INTEGER
	do
		background.blitsurface
		personnage.blitsurface
		sandbag.blitsurface
		error := SDL_Flip (screen)
		SDL_Delay (20000)
	end

end
