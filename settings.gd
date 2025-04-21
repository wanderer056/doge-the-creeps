extends Control

@onready var animation_player = $ReturnButton/AnimationPlayer
@onready var sfx_button = $SFXButton/toggle_button_sfx
@onready var music_button = $MusicButton/toggle_button_music
@onready var sound_button = $SoundButton/toggle_button_sound


func _ready() -> void:
	sfx_button.change_state(SoundManager.sfx_state)
	music_button.change_state(SoundManager.music_state)
	sound_button.change_state(SoundManager.sound_state)	


func _on_button_animation_timer_timeout() -> void:
	animation_player.play("slide")


func _on_return_button_pressed() -> void:
	SoundManager.play_click_sound()
	SceneTransition.change_scene_to_file("res://main_menu.tscn")


func _on_toggle_button_sfx_toggled(p_button_pressed) -> void:
	SoundManager.sfx_state = p_button_pressed
	SoundManager.play_click_sound()
		

func _on_toggle_button_music_toggled(p_button_pressed) -> void:
	SoundManager.music_state = p_button_pressed
	SoundManager.back_music(p_button_pressed)
	SoundManager.play_click_sound()	


func _on_toggle_button_sound_toggled(p_button_pressed) -> void:
	SoundManager.sound_state = p_button_pressed
	SoundManager.play_click_sound()

