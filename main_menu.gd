extends Control

signal started()

func _on_start_button_pressed() -> void:
	SoundManager.play_click_sound()
	SceneTransition.change_scene_to_file("res://main.tscn")
	started.emit()


func _on_exit_button_pressed() -> void:
	SoundManager.play_click_sound()	
	$ConfirmationDialog.set_visible(true)
	SoundManager.pop_music()


func _on_confirmation_dialog_confirmed() -> void:
	SoundManager.play_click_sound()	
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	SoundManager.play_click_sound()	
	SceneTransition.change_scene_to_file("res://settings.tscn")


func _on_confirmation_dialog_canceled() -> void:
	SoundManager.play_click_sound()
