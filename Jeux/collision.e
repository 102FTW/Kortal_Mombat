note
	description: "Cette classe permet de gérer les collisions entre les différents objets."
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

deferred class
	COLLISION

feature

	check_collide (a_collision: COLLISION): BOOLEAN -- Regarde si une collision survient entre deux objets
		local
			l_x: INTEGER -- Position x du deuxième objet collision
			l_y: INTEGER -- Position y du deuxième objet collision
			l_w: INTEGER -- Largeur du deuxième objet collision
			l_h: INTEGER -- Hauteur du deuxième objet collision
		do
			l_x := a_collision.x -- Initialise la position x du deuxième objet
			l_y := a_collision.y -- Initialise la position y du deuxième objet
			l_w := a_collision.width -- Initialise la largeur du deuxième objet
			l_h := a_collision.height -- initialise la hauteur du deuxième objet

			-- Cette condition vérifie si l'objet un est dans l'objet 2, ou si l'objet 2 est dans l'objet 1
			if (x >= l_x and x <= l_x + (l_w / 2) and y >= l_y and y <= l_y + l_h) -- FAIRE DES ROUTINES POUR CHAQUE LIGNE
			or (x + (width / 2) >= l_x and x + (width / 2) <= l_x + (l_w / 2) and y >= l_y and y <= l_y + l_h)
			or (x >= l_x and x <= l_x + (l_w / 2) and y + height >= l_y and y + height <= l_y + l_h)
			or (x + width / 2 >= l_x and x + width / 2 <= l_x + (l_w / 2) and y + height >= l_y and y + height <= l_y + l_h)
			or (l_x >= x and l_x <= x + (width / 2) and l_y >= y and l_y <= y + height)
			or (l_x + (l_w / 2) >= x and l_x + (l_w / 2) <= x + (width / 2) and l_y >= y and l_y <= y + height)
			or (l_x >= x and l_x <= x + (width / 2) and l_y + l_h >= y and l_y + l_h <= y + height)
			or (l_x + l_w / 2 >= x and l_x + l_w / 2 <= x + (width / 2) and l_y + l_h >= y and l_y + l_h <= y + height) then
				result := true -- il y a une collision
			else
				result := false -- il n'y a as de collision
			end
		end

	on_top_of (a_collision: COLLISION): BOOLEAN -- Vérifie si un objet de type collision est par dessus un autre objet
		local
			l_x: INTEGER -- Position x du deuxième objet collision
			l_y: INTEGER -- Position y du deuxième objet collision
			l_w: INTEGER -- Largeur du deuxième objet collision
			l_h: INTEGER -- Hauteur du deuxième objet collision
		do
			l_x := a_collision.x -- Initialise la position x du deuxième objet
			l_y := a_collision.y -- Initialise la position y du deuxième objet
			l_w := a_collision.width -- Initialise la largeur du deuxième objet
			l_h := a_collision.height -- initialise la hauteur du deuxième objet
			if y + height <= l_y and y + height >= l_y - 10 and ((x >= l_x and x <= l_x + l_w / 2) or (x + width / 2 >= l_x and x + width / 2 <= l_x + l_w / 2) or (l_x >= x and l_x <= x + width / 2) or (l_x + l_w / 2 = x and l_x + l_w / 2 <= x + width / 2)) then
				result := true -- L'objet 1 est sur l'objet 2
			else
				result := false -- L'objet 1 n'est pas sur l'objet 1
			end
		end

	width: INTEGER -- Largeur de l'objet collision
		deferred -- Vas chercher cette largeur dans la classe image
		end

	height: INTEGER --hauteur de l'objet collision
		deferred -- Vas chercher cette hauteur dans la classe image
		end

	x: INTEGER assign set_x --position x de l'objet collision
		deferred -- Vas chercher la position x dans la classe image
		end

	y: INTEGER assign set_y --position y de l'objet collision
		deferred -- vas chercher la position y dans la classe image
		end

	set_x (a_x: INTEGER) -- set la position x de l'objet collision
		deferred -- Utilise le setter présent dans la classe image
		end

	set_y (a_y: INTEGER) -- set la position y de l'objet collision
		deferred -- Utilise le setter présent dans la classe image
		end

end
