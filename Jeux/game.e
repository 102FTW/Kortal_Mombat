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

feature

	make
		local
			l_perso:PERSONAGE
			l_projectile:PROJECTILE
			event:EVENT
			display:DISPLAY

		do
			create event.make
			create display.make
			from
			until
				event.quit_happens
			loop
				event.handle
				if event.right_pressed then
					display.personnage.go_right
				end

				if event.left_pressed then
					display.personnage.go_left
				end

				if event.up_pressed then
					display.personnage.go_up
				end

				if event.down_pressed then
					display.personnage.go_down
				end
				display.show
			end
			SDL_QUIT_BYE
		end
end
