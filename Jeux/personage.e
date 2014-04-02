note
	description: "Summary description for {PERSONAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSONAGE

inherit

	IMAGE
		rename
			make as make_image
		redefine
			blitsurface
		end

	COLLISION

	MOVEMENT

create
	make

feature

	hp: INTEGER assign set_hp

	gravity: INTEGER

	personage_left, personage_right: POINTER

	jumping: BOOLEAN assign set_jumping

	make (a_targetscreen: POINTER; a_path: STRING; a_x, a_y: INTEGER)
		local
			memory_manager: POINTER
		do
			orientation := 1
			make_image (a_targetscreen, a_path, a_x, a_y)
			personage_right := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (personage_right, 0)
			set_y_rect (personage_right, 0)
			set_w_rect (personage_right, (width//2).to_natural_16)
			set_h_rect (personage_right, 160)
			personage_left := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (personage_left, (width//2).to_integer_16)
			set_y_rect (personage_left, 0)
			set_w_rect (personage_left,  (width//2).to_natural_16)
			set_h_rect (personage_left, 160)
			gravity := 20
		end

	jump
		do
			if y - gravity >= 370 then --If the position of the personage is bellow the floor level after the movement, then cancel it
				jumping := false --set jumping to false so the jumping loop is stopped
				set_y (370) -- Place the personage at the floor level
				gravity := 20 -- Reset the gravity to base value
			else -- If the personnage is still in jump loop
				set_y (y - gravity) -- Move the personage
				gravity := gravity - 1 -- Lower the gravity so the personage moves smoothly
			end
		end

	set_jumping (a_jumping: BOOLEAN)
		do
			jumping := a_jumping
		end

	set_hp (a_hp: INTEGER)
		do
			hp := a_hp
		end

	orientation: INTEGER assign set_orientation

	set_orientation (a_orientation: INTEGER)
		do
			orientation := a_orientation
		end

	blitsurface
		local
			error: INTEGER
		do
			if orientation = 1 then
				error := SDL_BlitSurface (image, personage_right, screen, targetarea)
			end
			if orientation = 2 then
				error := SDL_BlitSurface (image, personage_left, screen, targetarea)
			end
			check
				BlitSurface: error = 0
			end
		end

	vitesse: INTEGER
		do
			result := 5
		end

end
