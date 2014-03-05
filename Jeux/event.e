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
	make_event

feature

	SDL_Event:POINTER

	quit_happens:BOOLEAN

	return_value: INTEGER

	make_event
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
	 			fetch_next
	 		end
	 	end

	fetch_next
		do
			return_value := SDL_PollEvent (SDL_EVENT)
		end

	exhausted: BOOLEAN
		do
			result := return_Value = 0
		end

	type: NATURAL_8
		do
			result := get_type (SDL_Event)
		end

	is_quit: BOOLEAN
		do
			if type = SDL_QUIT then
				Result := true
			else
				Result := false
			end
		end

end
