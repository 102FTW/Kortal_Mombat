note
	description: "Summary description for {MOVEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MOVEMENT

feature

	vitesse: INTEGER
		deferred
		end

	go_right
		do
			if x + vitesse + (get_w_image (image) / 2) < 1263 then
				set_x (x + vitesse)
			else
				destroy
			end
			set_orientation (1)
		end

	go_left
		do
			if x - vitesse > 0 then
				set_x (x - vitesse)
			else
				destroy
			end
			set_orientation (2)
		end

	go_up
		do
				--		set_y (y-vitesse)
		end

	go_down
		do
				--		set_y (y+vitesse)
		end

	destroy
		do
		end

	image: POINTER
		deferred
		end

	get_w_image (a_image: POINTER): INTEGER
		deferred
		end

	orientation: INTEGER assign set_orientation
		deferred
		end

	set_orientation (a_orientation: INTEGER)
		deferred
		end

	x: INTEGER assign set_x
		deferred
		end

	y: INTEGER assign set_y
		deferred
		end

	set_x (a_x: INTEGER)
		deferred
		end

	set_y (a_y: INTEGER)
		deferred
		end

end
