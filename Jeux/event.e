note
	description: "Cette classe permet de gérer les événements"
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

	return_value: INTEGER -- Contient la valeur de retour de la fonction poll event de SDL (1 si il y as un evenement, 0 si il n'y as pas d'évenements

feature

	quit_happens: BOOLEAN -- Est a true lorsque l'on doit quitter le jeux

	right_pressed: BOOLEAN -- Vérifie si le boutton right est appuyé

	up_pressed: BOOLEAN -- Vérifie si le button up est appuyé

	down_pressed: BOOLEAN -- Vérifie si le button down est appuyé

	left_pressed: BOOLEAN -- Vérifie si le button left est appuyé

	space_pressed: BOOLEAN -- Vérifie si le button space est appuyé

	w_pressed: BOOLEAN -- Vérifie si le button w est appuyé

	a_pressed: BOOLEAN -- Vérifie si le button a est appuyé

	s_pressed: BOOLEAN -- Vérifie si le button s est appuyé

	d_pressed: BOOLEAN -- Vérifie si le button d est appuyé

	rctrl_pressed: BOOLEAN-- Vérifie si le button rctrl est appuyé


	make -- Crée un espace mémoirs pour l'objet de type SDL_Event
		local
			l_memory_manager: POINTER
		do
			SDL_Event := l_memory_manager.memory_calloc (1, SDL_SIZEOF_EVENT)
		end

	handle -- Gère les évenements et lance les fonction appropriées au type d'évènements
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

	key_down -- Mets a true les variables associées au key pressed
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

	key_up -- Mets a false les keys associées au key up
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

	fetch_next -- Poll le prochain évènements
		do
			return_value := SDL_PollEvent (SDL_Event)
		end

	exhausted: BOOLEAN -- Renvoie true si il n'y as plus aucun évènements
		do
			result := return_value = 0
		end

	type: NATURAL_8 --Renvoie le type de l'évènement
		do
			result := get_type (SDL_Event)
		end

	is_quit: BOOLEAN -- Renvoie true si le type de l'évènement est quit
		do
			Result := type = SDL_QUIT
		end

	is_keydown: BOOLEAN -- Renvoie true si le type d'évènement est un keydown
		do
			Result := type = SDL_KEYDOWN
		end

	is_keyup: BOOLEAN -- Renvoie true si le type d'évènement est un keyup
		do
			Result := type = SDL_KEYUP
		end

end
