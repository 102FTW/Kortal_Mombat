note
	description: "[
			Cette classe permet de gérer les événements provoqués"
		 	lorsque nous pesons sur une touche
	]"
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	KEY_HANDLER

create
	make

feature {NONE} -- Initialisation

	make
		do
			gravity_1 := 1
			gravity_2 := 1
		end

feature

	gravity_1: INTEGER
			--	set_gravity_1(a_set_gravity_1:INTEGER)
			--	do
			--		gravity_1:=
			--	end

	gravity_2: INTEGER

	handle (a_event: EVENT; a_personage_1, a_personage_2: PERSONAGE; a_projectile_1, a_projectile_2: PROJECTILE)
		local
			l_x, l_y: INTEGER
		do
			if a_event.space_pressed AND a_projectile_2.spawned = false then
				a_projectile_2.spawn (a_personage_2.x, a_personage_2.y, a_personage_2.orientation)
			end
			if a_event.rctrl_pressed AND a_projectile_1.spawned = false then
				a_projectile_1.spawn (a_personage_1.x, a_personage_1.y, a_personage_1.orientation)
			end
			if a_event.right_pressed then
				l_x := a_personage_1.x
				a_personage_1.go_right
				if a_personage_1.check_collide (a_personage_2) then
					a_personage_1.x := l_x
				end
			end
			if a_event.left_pressed then
				l_x := a_personage_1.x
				a_personage_1.go_left
				if a_personage_1.check_collide (a_personage_2) then
					a_personage_1.x := l_x
				end
			end
			if a_event.up_pressed AND a_personage_1.on_floor then --If up is pressed and the personage isnt already in a jump loop
				a_personage_1.jumping := true -- set jumping at true, to start the jumping loop
			end
			if a_event.down_pressed AND a_personage_1.check_collide (a_personage_2) = false then
					--	display.personnage.duck
			end
			if a_event.w_pressed AND a_personage_2.on_floor then
				a_personage_2.jumping := true
			end
			if a_event.a_pressed then
				l_x := a_personage_2.x
				a_personage_2.go_left
				if a_personage_2.check_collide (a_personage_1) then
					a_personage_2.x := l_x
				end
			end
			if a_event.d_pressed then
				l_x := a_personage_2.x
				a_personage_2.go_right
				if a_personage_2.check_collide (a_personage_1) then
					a_personage_2.x := l_x
				end
			end
			if a_personage_1.jumping then -- if personnage is in a jumping loop
				l_y := a_personage_1.y
				a_personage_1.y := a_personage_1.y - a_personage_1.gravity
				if a_personage_1.check_collide (a_personage_2) then
					a_personage_1.y := l_y
					a_personage_1.stop_jump
				else
					a_personage_1.y := l_y
					a_personage_1.jump
				end
			else
				if a_personage_1.on_floor = false then
					a_personage_1.y := a_personage_1.y + gravity_1
					if a_personage_1.check_collide (a_personage_2) then
						a_personage_1.y := a_personage_1.y - gravity_1
						a_personage_1.on_floor := true
						gravity_1 := 1
					else
						gravity_1 := gravity_1 + 1
					end
				end
			end
			if a_personage_2.jumping then
				l_y := a_personage_2.y
				a_personage_2.y := a_personage_2.y - a_personage_2.gravity
				if a_personage_2.check_collide (a_personage_1) then
					a_personage_2.y := l_y
					a_personage_2.stop_jump
				else
					a_personage_2.y := l_y
					a_personage_2.jump
				end
			else
				if a_personage_2.on_floor = false then
					a_personage_2.y := a_personage_2.y + gravity_2
					if a_personage_2.check_collide (a_personage_1) then
						a_personage_2.y := a_personage_2.y - gravity_2
						a_personage_2.on_floor := true
						gravity_2 := 1
					else
						gravity_2 := gravity_2 + 1
					end
				end
			end
			if a_projectile_2.spawned then
				a_projectile_2.move
			end
			if a_projectile_1.spawned then
				a_projectile_1.move
			end
			if a_projectile_2.check_collide (a_personage_1) then
				a_personage_1.hurt (10)
				a_projectile_2.destroy
			end
			if a_projectile_1.check_collide (a_personage_2) then
				a_personage_2.hurt (10)
				a_projectile_1.destroy
			end
			if a_projectile_1.check_collide (a_projectile_2) then
				a_projectile_1.destroy
				a_projectile_2.destroy
			end
			if a_personage_1.y >= 370 then --floor level
				a_personage_1.y := 370
				a_personage_1.on_floor := true
				gravity_1 := 1
			else
				a_personage_1.on_floor := false
			end
			if a_personage_2.y >= 370 then
				a_personage_2.y := 370
				a_personage_2.on_floor := true
				gravity_2 := 1
			else
				a_personage_2.on_floor := false
			end
			if a_personage_2.on_top_of (a_personage_1) then
				a_personage_2.on_floor := true
				gravity_2 := 1
			end
			if a_personage_1.on_top_of (a_personage_2) then
				a_personage_1.on_floor := true
				gravity_1 := 1
			end
		end

end
