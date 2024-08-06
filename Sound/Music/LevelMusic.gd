extends AudioStreamPlayer

const level_music = preload("res://Sound/Music/ost01.mp3")

func _play_music(music: AudioStreamMP3, volume = 0.0):
	if stream == music:
		return
		
		stream = music
		volume_db = volume
		play()

func play_music_level():
	_play_music(level_music)
