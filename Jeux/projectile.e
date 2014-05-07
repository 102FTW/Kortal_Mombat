note
	description: "Cette classe permet de gérer les projectiles"
				 "lancé par les personnages"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	PROJECTILE

inherit

	IMAGE
		rename
			make as make_image
		redefine
			blitsurface
		end
	COLLISION

	MOVEMENT
		redefine
			destroy
		end

create
	make

feature
	projectile_left, projectile_right:POINTER

	spawned: BOOLEAN

	orientation: INTEGER assign set_orientation

	make(a_targetscreen:POINTER;a_path:STRING;a_x,a_y:INTEGER)
		local
			memory_manager:POINTER
		do
			make_image(a_targetscreen,a_path,a_x,a_y)

			projectile_right := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (projectile_right,0)
			set_y_rect (projectile_right,0)
			set_w_rect (projectile_right, 80)
			set_h_rect (projectile_right, 56)

			projectile_left := memory_manager.memory_calloc (1, SDL_SIZEOF)
			set_x_rect (projectile_left,80)
			set_y_rect (projectile_left,0)
			set_w_rect (projectile_left, 80)
			set_h_rect (projectile_left, 56)
		end

	set_orientation (a_orientation: INTEGER)
		do
			orientation := a_orientation
		end

	destroy
		do
			spawned:=false
			set_x(-100)
			set_y(-100)
		end

	spawn(a_x,a_y,a_orientation:INTEGER)
		do
			spawned:=true
			set_x(a_x+72)
			set_y(a_y+80)
			orientation:=a_orientation
		end
	move
		do
			if orientation=1 then
				go_right
			else
				go_left
			end
		end
	blitsurface
	local
		error:INTEGER
	do
		if orientation=1 then
			error := SDL_BlitSurface (image, projectile_right, screen, targetarea)
		end
		if orientation=2 then
			error := SDL_BlitSurface (image, projectile_left, screen, targetarea)
		end
		check
			BlitSurface: error=0
		end
	end
	vitesse:INTEGER
	do
		result:=10
	end

end
