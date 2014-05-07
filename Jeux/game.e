note
	description: "Cette classe est la classe maîtresse du programme."
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	GAME
inherit
	SDL_WRAPPER
create
	make

feature -- Access

feature

	make
		local
			event:EVENT
			display:DISPLAY
			key_handler:KEY_HANDLER

		do
			create event.make
			create display.make
			create key_handler.make
			from
			until
				event.quit_happens
			loop
				event.handle
				key_handler.handle (event, display.personnage,display.personnage2, display.projectile1, display.projectile2)
				display.show
			end
			SDL_QUIT_BYE
		end
end
