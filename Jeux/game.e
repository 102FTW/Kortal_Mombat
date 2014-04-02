note
	description: "Jeux application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	GAME
inherit
	SDL_WRAPPER
create
	make

feature -- Access

	Menu: MENU
			-- `Menu'
		attribute check False then end end --| Remove line when `Menu' is initialized in creation procedure.

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
