note
	description: "Summary description for {MOVEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MOVEMENT

feature
	vitesse:INTEGER
	do
		result:=4
	end
	go_right
		do
			set_x (x + vitesse)
		end

	go_left
		do
			set_x (x-vitesse)
		end

	go_up
		do
			set_y (y-vitesse)
		end

	go_down
		do
			set_y (y+vitesse)
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
