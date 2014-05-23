note
	description: "Cette classe permet de gérer un image en SDL"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	IMAGE

inherit

	SDL_WRAPPER

create
	make

feature {NONE} -- initialisation

	make (a_targetscreen: POINTER; a_path: STRING; a_x, a_y: INTEGER) -- Crée une image avec un path et une position x et y
		local
			path_image: C_STRING
			memory_manager: POINTER
		do
			screen := a_targetscreen
			create path_image.make (a_path)
			image := SDL_LoadBMP (path_image.item)
			targetarea := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x (a_x.to_integer_16)
			set_y (a_y.to_integer_16)
			set_w_rect (targetarea, get_w_image (image).to_natural_16)
			set_h_rect (targetarea, get_h_image (image).to_natural_16)
			SetColorKey
		end

feature

	image : POINTER -- Contient l'adresse de l'image
	screen : POINTER -- Contient l'adresse de l'écran sur laquelle l'image doit etre affichée
	targetarea: POINTER --Contient les coordonées de l'image

	SetColorKey -- Set le couleur que SDL doit considérer comme invisible
		local
			error: INTEGER
		do
			error := SDL_SetColorKey (image, SDL_SRCCOLORKEY, SDL_MapRGB (get_format (screen), 0, 255, 255))
		end

	BlitSurface -- Affiche l'image sur l'écran
		local
			error: INTEGER
		do
			error := SDL_BlitSurface (image, Create {POINTER}, screen, targetarea)
			check
				BlitSurface: error = 0
			end
		end

	x: INTEGER assign set_x -- Position x de l'image
		do
			result := get_x_rect (targetarea).to_integer
		end

	y: INTEGER assign set_y -- Position y de l'image
		do
			result := get_y_rect (targetarea).to_integer
		end

	set_x (a_x: INTEGER) -- set la position x de l'image
		do
			set_x_rect (targetarea, a_x.to_integer_16)
		end

	set_y (a_y: INTEGER) -- set la position x de l'image
		do
			set_y_rect (targetarea, a_y.to_integer_16)
		end

	width: INTEGER -- contient la largeur de l'image
		do
			result := get_w_image (image)
		end

	height: INTEGER -- contient la hauteur de l'image
		do
			result := get_h_image (image)
		end

end
