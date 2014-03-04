note
	description: "Summary description for {MENU}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MENU

feature -- Access

	menu_event: EVENT
			-- `menu_event'
		attribute check False then end end --| Remove line when `menu_event' is initialized in creation procedure.

	Images_menu: IMAGE
			-- `Images_menu'
		attribute check False then end end --| Remove line when `Images_menu' is initialized in creation procedure.

end
