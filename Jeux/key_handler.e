note
	description: "Summary description for {KEY_HANDLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KEY_HANDLER

create
	make

feature

	make
		do
		end

	handle (a_event: EVENT; a_personage_1,a_personage_2: PERSONAGE; a_projectile_1,a_projectile_2: PROJECTILE)
		do
			if a_event.space_pressed AND a_projectile_2.spawned = false then
				a_projectile_2.spawn (a_personage_2.x, a_personage_2.y, a_personage_2.orientation)
			end
			if a_event.right_pressed AND a_personage_1.check_collide (a_personage_2)=false then
				a_personage_1.go_right
			end
			if a_event.left_pressed AND a_personage_1.check_collide (a_personage_2)=false then
				a_personage_1.go_left
			end
			if a_event.up_pressed AND a_personage_1.jumping = false then --If up is pressed and the personage isnt already in a jump loop
				a_personage_1.jumping := true -- set jumping at true, to start the jumping loop
			end
			if a_event.down_pressed AND a_personage_1.check_collide (a_personage_2)=false then
					--	display.personnage.duck
			end
			if a_event.a_pressed AND a_personage_1.check_collide (a_personage_2)=false then
				a_personage_2.go_left
			end
			if a_event.w_pressed AND a_personage_2.jumping = false then
				a_personage_2.jumping := true
			end
			if a_event.d_pressed then
				a_personage_2.go_right
			end

			if a_personage_1.jumping AND a_personage_1.check_collide_y (a_personage_2)=false then -- if personnage is in a jumping loop
				a_personage_1.jump -- Do the next step into the jumping loop
			end
			if a_personage_2.jumping  AND a_personage_1.check_collide_y (a_personage_2)=false then
				a_personage_2.jump
			end
			if a_projectile_2.spawned then
				a_projectile_2.move
			end

			if a_projectile_2.check_collide (a_personage_1) then
				--REDUIRE LES HP
				a_projectile_2.destroy
			end
		end

end
