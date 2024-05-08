extends TextureButton

var music_bus = AudioServer.get_bus_index("Master")
const MUSIC_OFF = preload("res://assets/icon/music-off.png")
const MUSIC_ON = preload("res://assets/icon/music-on.png")

func _on_TextureButton_pressed():
	
	# toggle music on/off
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	
	# toggle texture
	if AudioServer.is_bus_mute(music_bus):
		texture_normal = MUSIC_OFF
	else:
		texture_normal = MUSIC_ON
