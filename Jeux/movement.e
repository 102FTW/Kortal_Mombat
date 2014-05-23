note
	description: "Cette classe permet de gérer le mouvement des objets."
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

deferred class
	MOVEMENT

feature

	vitesse: INTEGER
		deferred
		end

	go_right -- Déplace `current' vers la droite
		do
			if x + vitesse + (get_w_image (image) / 2) < 1263 then
				set_x (x + vitesse)
			else
				destroy
			end
			set_orientation (1)
		end

	go_left -- Déplace `current' vers la gauche
		do
			if x - vitesse > 0 then
				set_x (x - vitesse)
			else
				destroy
			end
			set_orientation (2)
		end

	destroy -- Fonction utilisé par les projectile seulement
		do
		end

	image: POINTER -- Contient l'image de `current'
		deferred
		end

	get_w_image (a_image: POINTER): INTEGER -- Nous renvoie la width de `current'
		deferred
		end

	orientation: INTEGER assign set_orientation --Nous renvoie l'orientation de `current'
		deferred
		end

	set_orientation (a_orientation: INTEGER)-- Set l'orientation de `current'
		deferred
		end
	x: INTEGER assign set_x -- Possition x de `current'
		deferred
		end

	y: INTEGER assign set_y -- Position y de `current'
		deferred
		end

	set_x (a_x: INTEGER) -- Set la position x de `current'
		deferred
		end

	set_y (a_y: INTEGER) -- Set la position y de `current'
		deferred
		end

end
