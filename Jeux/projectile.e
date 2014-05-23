note
	description: "[
			Cette classe permet de gérer les projectiles
		 	lancé par les personnages
	]"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	PROJECTILE

inherit

	IMAGE
		rename
			make as make_image
		redefine
			blitsurface
		end

	COLLISION

	MOVEMENT
		redefine
			destroy
		end

create
	make

feature {NONE} --initialisation

	make (a_targetscreen: POINTER; a_path: STRING; a_x, a_y: INTEGER) -- Initialise l'image et la position du projectile
		local
			memory_manager: POINTER
		do
			make_image (a_targetscreen, a_path, a_x, a_y)
			projectile_right := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (projectile_right, 0)
			set_y_rect (projectile_right, 0)
			set_w_rect (projectile_right, 80)
			set_h_rect (projectile_right, 56)
			projectile_left := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (projectile_left, 80)
			set_y_rect (projectile_left, 0)
			set_w_rect (projectile_left, 80)
			set_h_rect (projectile_left, 56)
		end

feature

	projectile_left: POINTER -- Contient l'image d'un projectile allant vers la gauche
	projectile_right: POINTER -- Contient l'image d'un projectiel allant vers la droite

	spawned: BOOLEAN -- Est a true lorsque le projectile est apparu

	orientation: INTEGER assign set_orientation -- Contient L'orentation du personange

	set_orientation (a_orientation: INTEGER) -- Set l'orientation du personnage
		do
			orientation := a_orientation
		end

	destroy -- Détruit le projectile
		do
			spawned := false
			set_x (-100)
			set_y (-100)
		end

	spawn (a_x, a_y, a_orientation: INTEGER) -- Fait apparaitre le projectile a la position du personnage
		do
			spawned := true
			set_x (a_x + 72)
			set_y (a_y + 80)
			orientation := a_orientation
		end

	move -- Déplace le projectile
		do
			if orientation = 1 then
				go_right
			else
				go_left
			end
		end

	blitsurface -- Affiche le projectile sur l'écran en fonction de son orientation
		local
			error: INTEGER
		do
			if orientation = 1 then
				error := SDL_BlitSurface (image, projectile_right, screen, targetarea)
			end
			if orientation = 2 then
				error := SDL_BlitSurface (image, projectile_left, screen, targetarea)
			end
			check
				BlitSurface: error = 0
			end
		end

	vitesse: INTEGER -- Vitesse du projectile
		do
			result := 10
		end

end
