note
	description: "Summary description for {SOUND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SOUND
inherit
	SDL_wrapper
create
	make
feature
	audio_rate,audio_channels,audio_buffers:INTEGER
	audio_format:NATURAL_16
	noise:POINTER
	noiseChannel:INTEGER
	make(a_path:STRING)
	local
		path_sound:C_STRING
	do
		create path_sound.make (a_path)
		noiseChannel:= -1
		audio_rate := 22050
  		audio_format := AUDIO_S16SYS
 		audio_channels := 2
 		audio_buffers := 4096
 		if Mix_OpenAudio(audio_rate, audio_format, audio_channels, audio_buffers) = -1 then
 			io.put_string ("Error Mix_OpenAudio")
 			io.put_new_line
 		end
		noise := Mix_LoadWAV(path_sound.item)
	end
	play
	local
	do
		if noiseChannel < 0 then
			noiseChannel := Mix_PlayChannel(-1, noise, 0)
		end
	end
end