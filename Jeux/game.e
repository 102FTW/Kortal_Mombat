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

	 --| Remove line when `Collision' is initialized in creation procedure.

	affichage: DISPLAY
			-- `affichage'
		attribute check False then end end --| Remove line when `affichage' is initialized in creation procedure.

feature

	make
		local
			l_perso:PERSONAGE
			l_projectile:PROJECTILE
			event:EVENT

		do
			create event.make
			create affichage.make
			from
			until
				event.quit_happens
			loop
				event.handle
				if event.right_pressed then -- AJOUTER LEFT UP DOWN

				end
				affichage.show
			end
			SDL_QUIT_BYE
		end
end
