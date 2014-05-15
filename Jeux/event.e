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

	SDL_Event: POINTER

	return_value: INTEGER

feature

	quit_happens: BOOLEAN

	right_pressed: BOOLEAN

	up_pressed: BOOLEAN

	down_pressed: BOOLEAN

	left_pressed: BOOLEAN

	space_pressed: BOOLEAN

	w_pressed: BOOLEAN

	a_pressed: BOOLEAN

	s_pressed: BOOLEAN

	d_pressed: BOOLEAN

	rctrl_pressed: BOOLEAN



	make
		local
			memory_manager: POINTER
		do
			SDL_Event := memory_manager.memory_calloc (1, SDL_SIZEOF_EVENT)
		end

	handle
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

	key_down
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

	key_up
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

	fetch_next
		do
			return_value := SDL_PollEvent (SDL_Event)
		end

	exhausted: BOOLEAN
		do
			result := return_value = 0
		end

	type: NATURAL_8
		do
			result := get_type (SDL_Event)
		end

	is_quit: BOOLEAN
		do
			Result := type = SDL_QUIT
		end

	is_keydown: BOOLEAN
		do
			Result := type = SDL_KEYDOWN
		end

	is_keyup: BOOLEAN
		do
			Result := type = SDL_KEYUP
		end

end
