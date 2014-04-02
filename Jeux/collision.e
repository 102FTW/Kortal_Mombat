note
	description: "Summary description for {COLLISION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COLLISION

feature
	check_collide(a_collision:COLLISION):BOOLEAN
		local
			l_x,l_y,l_w,l_h:INTEGER
		do
			l_x:=a_collision.x
			l_y:=a_collision.y
			l_w:=a_collision.width
			l_h:=a_collision.height
			if 	(x>=l_x and x<=l_x+(l_w/2) and y>=l_y and y<=l_y+l_h)
			 OR (x+(width/2)>=l_x and x+(width/2)<=l_x+(l_w/2) and y>=l_y and y<=l_y+l_h)
			 OR (x>=l_x and x<=l_x+(l_w/2) and y+height>=l_y and y+height<=l_y+l_h)
			 OR (x+width/2>=l_x and x+width/2<=l_x+(l_w/2) and y+height>=l_y and y+height<=l_y+l_h) then
				result:=true
			else
				result:=false
			end

		end
	check_collide_y(a_collision:COLLISION):BOOLEAN
		local
			l_x,l_y,l_w,l_h:INTEGER
		do
			l_x:=a_collision.x
			l_y:=a_collision.y
			l_w:=a_collision.width
			l_h:=a_collision.height
			if 	(y>=l_y and y<=l_y+l_h)
			 OR (y>=l_y and y<=l_y+l_h)
			 OR (y+height>=l_y and y+height<=l_y+l_h)
			 OR (y+height>=l_y and y+height<=l_y+l_h) then
				result:=true
			else
				result:=false
			end

		end

	check_collide_personage(a_collision:COLLISION):BOOLEAN
		local
			l_x,l_y,l_w,l_h:INTEGER
		do
			l_x:=a_collision.x
			l_y:=a_collision.y
			l_w:=a_collision.width
			l_h:=a_collision.height
			if (x+width/2>l_x) then
				result:=true
			else
				result:=false
			end

		end

	width: INTEGER
		deferred
		end

	height: INTEGER
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
