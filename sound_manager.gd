extends Node

var music_state = true
var sfx_state = true
var sound_state = true

@onready var click_player = $ClickSoundPlayer
@onready var background_player = $BackgroundPlayer
@onready var game_music_player = $GameMusic
@onready var death_sound_player = $DeathSound
@onready var pop_sound_player = $PopSoundPlayer


func play_click_sound() -> void:
	if sfx_state:
		click_player.play()
	
				
func back_music(p_state: bool = music_state) -> void:
	if p_state:
		background_player.play()
	else:
		background_player.stop()
	
		
func game_music(p_state:bool) -> void:
	if sound_state:
		if p_state:
			game_music_player.play()
		else:
			game_music_player.stop()
	
		
func death_music() -> void:
	if sound_state:
		death_sound_player.play()
	
		
func pop_music() -> void:
	if sfx_state:
		pop_sound_player.play()
	
