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

	Handle_Event: EVENT
			-- `Handle_Event'
		attribute check False then end end --| Remove line when `Handle_Event' is initialized in creation procedure.

	affichage: AFFICHAGE
			-- `affichage'
		attribute check False then end end --| Remove line when `affichage' is initialized in creation procedure.

feature

	make
		local
			l_perso:PERSONNAGE
			l_projectile:PROJECTILE
		do
			create Handle_Event.make_event
			create affichage.make_affichage
			from
			until
				handle_event.quit_happens
			loop
				Handle_event.handle
				affichage.afficher
			end
			SDL_QUIT_BYE
		end
end
