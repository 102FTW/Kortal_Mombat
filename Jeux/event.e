note
	description: "Summary description for {EVENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EVENT

inherit

	SDL_WRAPPER

create
	make

feature

	SDL_Event:POINTER

	quit_happens,right_pressed,up_pressed,down_pressed,left_pressed:BOOLEAN

	return_value: INTEGER

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
	 				quit_happens:= true
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
			keysym:INTEGER
		do
			keysym:=SDL_GetKeySym (SDL_GetKey(SDL_Event))
			right_pressed:=(keysym = SDLK_RIGHT)
			left_pressed:=(keysym = SDLK_LEFT)
			up_pressed:=(keysym = SDLK_UP)
			down_pressed:=(keysym = SDLK_DOWN)
		end
	key_up
		local
			keysym:INTEGER
		do
			keysym:=SDL_GetKeySym (SDL_GetKey(SDL_Event))
			if keysym = SDLK_RIGHT then
				right_pressed:=false
			end

			if keysym = SDLK_LEFT then
						left_pressed:=false
			end

			if keysym = SDLK_UP then
						up_pressed:=false
			end

			if keysym = SDLK_DOWN then
						down_pressed:=false
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
			Result:=type = SDL_QUIT
		end

	is_keydown: BOOLEAN
		do
			Result:=type = SDL_KEYDOWN
		end

	is_keyup: BOOLEAN
		do
			Result:=type = SDL_KEYUP
		end

end
