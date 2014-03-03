note
	description: "Jeux application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

create
	make

feature

	make
		local
			affichage:AFFICHAGE
		do
			create affichage.make_affichage
			affichage.afficher
		end
end
