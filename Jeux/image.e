note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IMAGE
inherit
	SDL_WRAPPER
create
	make_image
feature
	image,screen,targetarea,memory_manager:POINTER
	make_image(Targetscreen:POINTER;path:STRING;x,y:INTEGER)
	local
		path_image:C_STRING
	do
		screen:=targetscreen
		create path_image.make (path)
		image:=SDL_LoadBMP (path_image.item)
		targetarea := memory_manager.memory_calloc (1, SDL_SIZEOF)
		set_x_rect (targetarea, x.to_integer_16)
		set_y_rect (targetarea, y.to_integer_16)
		set_w_rect (targetarea, get_w_image(image).to_natural_16)
		set_h_rect (targetarea, get_h_image(image).to_natural_16)
		SetColorKey
	end
	SetColorKey
	local
		error:INTEGER
	do
		error:=SDL_SetColorKey(image,SDL_SRCCOLORKEY,SDL_MapRGB(get_format(screen),0,255,255))
	end
	BlitSurface()
	local
		error:INTEGER
	do
		error := SDL_BlitSurface (image, Create {POINTER}, screen, targetarea)
		check
			BlitSurface: error=0
		end
	end
end
