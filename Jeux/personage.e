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
	hp:INTEGER assign set_hp
	gravity:INTEGER
	personage_left, personage_right:POINTER
	jumping:BOOLEAN assign set_jumping
	make(a_targetscreen:POINTER;a_path:STRING;a_x,a_y:INTEGER)
	local
		memory_manager:POINTER
	do
		orientation:=1

		make_image(a_targetscreen,a_path,a_x,a_y)

		personage_right := memory_manager.memory_calloc (1, SDL_SIZEOF)
		set_x_rect (personage_right,0)
		set_y_rect (personage_right,0)
		set_w_rect (personage_right, 144)
		set_h_rect (personage_right, 160)

		personage_left := memory_manager.memory_calloc (1, SDL_SIZEOF)
		set_x_rect (personage_left,144)
		set_y_rect (personage_left,0)
		set_w_rect (personage_left, 144)
		set_h_rect (personage_left, 160)

		gravity:=16
	end

	jump
	do
		if y-gravity > 370 then
			jumping:=false
			set_y(370)
			gravity:=16
		else
			set_y(y-gravity)
			gravity:=gravity-1
		end
	end

	set_jumping(a_jumping:BOOLEAN)
	do
		jumping:=a_jumping
	end
	set_hp(a_hp:INTEGER)
	do
		hp:=a_hp
	end
	orientation:INTEGER assign set_orientation
	set_orientation(a_orientation:INTEGER)
	do
		orientation:=a_orientation
	end
	blitsurface
	local
		error:INTEGER
	do
		if orientation=1 then
			error := SDL_BlitSurface (image, personage_right, screen, targetarea)
		end
		if orientation=2 then
			error := SDL_BlitSurface (image, personage_left, screen, targetarea)
		end
		check
			BlitSurface: error=0
		end
	end
	vitesse:INTEGER
	do
		result:=5
	end
end
