note
	description: "Cette classe permet de g�rer les �v�nements"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	EVENT

inherit

	SDL_WRAPPER

create
	make

feature {NONE}

	SDL_Event: POINTER -- Contient l'objet event de la librairie SDL

	return_value: INTEGER -- Contient la valeur de retour de la fonction poll event de SDL (1 si il y as un evenement, 0 si il n'y as pas d'�venements

feature

	quit_happens: BOOLEAN -- Est a true lorsque l'on doit quitter le jeux

	right_pressed: BOOLEAN -- V�rifie si le boutton right est appuy�

	up_pressed: BOOLEAN -- V�rifie si le button up est appuy�

	down_pressed: BOOLEAN -- V�rifie si le button down est appuy�

	left_pressed: BOOLEAN -- V�rifie si le button left est appuy�

	space_pressed: BOOLEAN -- V�rifie si le button space est appuy�

	w_pressed: BOOLEAN -- V�rifie si le button w est appuy�

	a_pressed: BOOLEAN -- V�rifie si le button a est appuy�

	s_pressed: BOOLEAN -- V�rifie si le button s est appuy�

	d_pressed: BOOLEAN -- V�rifie si le button d est appuy�

	rctrl_pressed: BOOLEAN-- V�rifie si le button rctrl est appuy�


	make -- Cr�e un espace m�moirs pour l'objet de type SDL_Event
		local
			l_memory_manager: POINTER
		do
			SDL_Event := l_memory_manager.memory_calloc (1, SDL_SIZEOF_EVENT)
		end

	handle -- G�re les �venements et lance les fonction appropri�es au type d'�v�nements
		do
			from
				fetch_next
			until
				exhausted
			loop
				if is_quit then
					quit_happens := true
				end
				if is_keydown then
					key_down
				end
				if is_keyup then
					key_up
				end
				fetch_next
			end
		end

	key_down -- Mets a true les variables associ�es au key pressed
		local
			keysym: INTEGER
		do
			keysym := SDL_GetKeySym (SDL_GetKey (SDL_Event))
			if keysym = SDLK_RIGHT then
				right_pressed := true
			end
			if keysym = SDLK_LEFT then
				LEFT_pressed := true
			end
			if keysym = SDLK_UP then
				up_pressed := true
			end
			if keysym = SDLK_DOWN then
				down_pressed := true
			end
			if keysym = SDLK_SPACE then
				space_pressed := true
			end
			if keysym = SDLK_w then
				w_pressed := true
			end
			if keysym = SDLK_a then
				a_pressed := true
			end
			if keysym = SDLK_s then
				s_pressed := true
			end
			if keysym = SDLK_d then
				d_pressed := true
			end
			if keysym = SDLK_RCTRL then
				rctrl_pressed := true
			end
		end

	key_up -- Mets a false les keys associ�es au key up
		local
			keysym: INTEGER
		do
			keysym := SDL_GetKeySym (SDL_GetKey (SDL_Event))
			if keysym = SDLK_RIGHT then
				right_pressed := false
			end
			if keysym = SDLK_LEFT then
				left_pressed := false
			end
			if keysym = SDLK_UP then
				up_pressed := false
			end
			if keysym = SDLK_DOWN then
				down_pressed := false
			end
			if keysym = SDLK_SPACE then
				space_pressed := false
			end
			if keysym = SDLK_w then
				w_pressed := false
			end
			if keysym = SDLK_a then
				a_pressed := false
			end
			if keysym = SDLK_s then
				s_pressed := false
			end
			if keysym = SDLK_d then
				d_pressed := false
			end
			if keysym = SDLK_RCTRL then
				rctrl_pressed := false
			end
		end

	fetch_next -- Poll le prochain �v�nements
		do
			return_value := SDL_PollEvent (SDL_Event)
		end

	exhausted: BOOLEAN -- Renvoie true si il n'y as plus aucun �v�nements
		do
			result := return_value = 0
		end

	type: NATURAL_8 --Renvoie le type de l'�v�nement
		do
			result := get_type (SDL_Event)
		end

	is_quit: BOOLEAN -- Renvoie true si le type de l'�v�nement est quit
		do
			Result := type = SDL_QUIT
		end

	is_keydown: BOOLEAN -- Renvoie true si le type d'�v�nement est un keydown
		do
			Result := type = SDL_KEYDOWN
		end

	is_keyup: BOOLEAN -- Renvoie true si le type d'�v�nement est un keyup
		do
			Result := type = SDL_KEYUP
		end

end
