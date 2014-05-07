note
	description: "Cette classe permet de gérer les collisions entre les différents objets."
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

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
			 OR (x+width/2>=l_x and x+width/2<=l_x+(l_w/2) and y+height>=l_y and y+height<=l_y+l_h)
			 OR (l_x>=x and l_x<=x+(width/2) and l_y>=y and l_y<=y+height)
			 OR (l_x+(l_w/2)>=x and l_x+(l_w/2)<=x+(width/2) and l_y>=y and l_y<=y+height)
			 OR (l_x>=x and l_x<=x+(width/2) and l_y+l_h>=y and l_y+l_h<=y+height)
			 OR (l_x+l_w/2>=x and l_x+l_w/2<=x+(width/2) and l_y+l_h>=y and l_y+l_h<=y+height) then
				result:=true
			else
				result:=false
			end

		end
	on_top_of(a_collision:COLLISION):BOOLEAN
		local
			l_x,l_y,l_w,l_h:INTEGER
		do
			l_x:=a_collision.x
			l_y:=a_collision.y
			l_w:=a_collision.width
			l_h:=a_collision.height
			if y+height<=l_y AND y+height>=l_y-10 AND (
				(x>=l_x and x<=l_x+l_w/2)OR
				(x+width/2>=l_x and x+width/2<=l_x+l_w/2)OR
				(l_x>=x and l_x<=x+width/2)OR
				(l_x+l_w/2=x and l_x+l_w/2<=x+width/2)) then
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
