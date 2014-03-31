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
		end

	COLLISION

	MOVEMENT
create
	make

feature
	hp:INTEGER assign set_hp
	make(a_targetscreen:POINTER;a_path:STRING;a_x,a_y:INTEGER)
	local
	do
		make_image(a_targetscreen,a_path,a_x,a_y)
	end

	set_hp(a_hp:INTEGER)
	do
		hp:=a_hp
	end
end
