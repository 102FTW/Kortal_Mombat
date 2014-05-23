note
	description: "Cette classe permet de gérer les sons du jeux."
	author: "Guillaume Boudreau et Philippe Paquette"
	date: "8 Mai 2014"
	revision: "1.0.0.0.0"

class
	SOUND

inherit

	SDL_wrapper

create
	make

feature {NONE} --initialisation

	audio_rate : INTEGER --
	audio_channels : INTEGER -- Chanel du son
    audio_buffers: INTEGER

	audio_format: NATURAL_16

	noise: POINTER

	noiseChannel: INTEGER

	make (a_path: STRING) -- Initialise les variables utilisé pour le son
		local
			path_sound: C_STRING
		do
			create path_sound.make (a_path)
			noiseChannel := -1
			audio_rate := 22050
			audio_format := AUDIO_S16SYS
			audio_channels := 2
			audio_buffers := 4096
			if Mix_OpenAudio (audio_rate, audio_format, audio_channels, audio_buffers) = -1 then
				io.put_string ("Error Mix_OpenAudio")
				io.put_new_line
			end
			noise := Mix_LoadWAV (path_sound.item)
		end

feature

	play -- Permet de jouer le son
		local
		do
			if noiseChannel < 0 then
				noiseChannel := Mix_PlayChannel (-1, noise, 0)
			end
		end

end
