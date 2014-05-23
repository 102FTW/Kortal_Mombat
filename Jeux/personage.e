note
	description: "[
			Cette classe de gérer les personnages dans le jeux"
		 	et leur point de vie
	]"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	PERSONAGE

inherit

	IMAGE
		rename
			make as make_image
		redefine
			blitsurface
		end

	COLLISION

	MOVEMENT

create
	make

feature

	hp_bar: IMAGE -- Contient l'image de la barre de points de vie

	pain: SOUND -- Contient le son joué lorsque le personnage recoie du dommage

	hp: INTEGER assign set_hp -- Contient les points de vie du personnage

	gravity: INTEGER assign set_gravity -- Contient la vitesse a laquelle le personannage doit tomber

	set_gravity (a_gravity: INTEGER) -- Set la valeur de la gravité
		do
			gravity := a_gravity
		end

	on_floor: BOOLEAN assign set_on_floor -- Est a true lorsque le personnage est sur une surface

	set_on_floor (a_on_floor: BOOLEAN) -- Set la valeur de on_floor
		do
			on_floor := a_on_floor
		end

	personage_left: POINTER -- Contient l'image du personange regardant vers la gauche
	personage_right: POINTER -- Conteint l'image du personange regardant vers la droite

	jumping: BOOLEAN assign set_jumping -- Est a true lorsque le personnage est dans une boucle de saut

	character_num: INTEGER -- if 1 == gimli if 2 == boromir

	make (a_targetscreen: POINTER; a_path: STRING; a_x, a_y, a_character_num: INTEGER)
		--Initialise les personnages et les valeurs associées a ceux-ci
		local
			memory_manager: POINTER
		do
			hp := 100
			orientation := 1
			make_image (a_targetscreen, a_path, a_x, a_y)
			personage_right := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (personage_right, 0)
			set_y_rect (personage_right, 0)
			set_w_rect (personage_right, (width // 2).to_natural_16)
			set_h_rect (personage_right, height.to_natural_16)
			personage_left := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (personage_left, (width // 2).to_integer_16)
			set_y_rect (personage_left, 0)
			set_w_rect (personage_left, (width // 2).to_natural_16)
			set_h_rect (personage_left, height.to_natural_16)
			gravity := 20
			on_floor := true
			if a_character_num = 1 then
				create hp_bar.make (a_targetscreen, "hp_bar.bmp", 963, 0)
			else
				create hp_bar.make (a_targetscreen, "hp_bar.bmp", 0, 0)
			end
			create pain.make ("sound/hurt.wav")
		end

	jump -- Fait le mouvement de saut de notre personnage
		do
			if gravity = 0 then
				stop_jump
			else
				set_y (y - gravity)
				gravity := gravity - 1
			end
		end

	stop_jump -- Arrete le saut
		do
			jumping := false
			gravity := 20
		end

	set_jumping (a_jumping: BOOLEAN) -- set la valeur de jumping
		do
			jumping := a_jumping
		end

	set_hp (a_hp: INTEGER) -- Set les points de vie du personnage
		do
			hp := a_hp
		end

	hurt (damage: INTEGER) -- Reduit les points de vie du pesronnage et
		do
			set_hp (hp - damage)
			pain.play
		end

	orientation: INTEGER assign set_orientation -- Contient l'orientation du personnage

	set_orientation (a_orientation: INTEGER) -- Set l'orientation du personange
		do
			orientation := a_orientation
		end

	show_hp -- Affiche la barre de points de vies
		local
			shown_surface, memory_manager: POINTER
			error: INTEGER
		do
			if hp >= 0 then
				shown_surface := memory_manager.memory_calloc (1, SDL_SIZEOF)
				set_x_rect (shown_surface, 0)
				set_y_rect (shown_surface, 0)
				set_w_rect (shown_surface, (25 + ((25 * hp) // 10)).to_natural_16)
				set_h_rect (shown_surface, 75)
				error := SDL_BlitSurface (hp_bar.image, shown_surface, screen, hp_bar.targetarea)
				shown_surface.memory_free
				memory_manager.memory_free
			end
		end

	blitsurface -- Affiche l'image sur l'écran en fonction de son orientation
		local
			error: INTEGER
		do
			if orientation = 1 then
				error := SDL_BlitSurface (image, personage_right, screen, targetarea)
			end
			if orientation = 2 then
				error := SDL_BlitSurface (image, personage_left, screen, targetarea)
			end
			check
				BlitSurface: error = 0
			end
		end

	vitesse: INTEGER -- Contient la vitesse de déplacement du personnage
		do
			result := 5
		end

end
