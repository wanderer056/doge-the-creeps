extends CanvasLayer

signal start_game
signal pause_game
signal resume_game

var start

@onready var restart_bttn = $RestartButton
@onready var home_bttn = $HomeButton
@onready var resume_bttn = $ResumeButton
@onready var pause_bttn = $PauseButton
@onready var resume_timer = $ResumeTimer
@onready var message = $Message


func _ready() -> void:
	start = 3


func show_message(p_text : String) -> void:
	$Message.text = p_text
	$Message.show()
	if p_text != "Game Over" and p_text != "Paused":
		$MessageTimer.start()

	
func show_game_over() -> void:
	pause_bttn.hide()		
	show_message("Game Over")
	await get_tree().create_timer(1.0).timeout
	restart_bttn.show()
	home_bttn.show()

	
func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()

	
func _on_message_timer_timeout() -> void:
	$Message.hide()

	
func update_score(p_score : int) -> void:
	$ScoreLabel.text = str(p_score)
	

func _on_home_button_pressed() -> void:
	SoundManager.play_click_sound()
	if $Message.text == "Paused":
		$ConfirmationDialog.visible = true
		SoundManager.pop_music()
	else:
		get_tree().paused = false
		SoundManager.play_click_sound()
		SoundManager.game_music(false)
		SceneTransition.change_scene_to_file("res://main_menu.tscn")
		SoundManager.back_music()


func _on_restart_button_pressed() -> void:
	SoundManager.play_click_sound()
	SoundManager.play_click_sound()
	pause_bttn.show()
	start_game.emit()


func _on_pause_button_pressed() -> void:
	SoundManager.play_click_sound()	
	show_message("Paused")
	home_bttn.show()
	resume_bttn.show()
	pause_game.emit()


func _on_resume_button_pressed() -> void:
	resume_bttn.hide()
	home_bttn.hide()
	$Message.text = "3"
	resume_timer.start()


func _on_resume_timer_timeout() -> void:
	if start >= 2:
		start -= 1
		$Message.text = str(start)
		$Message.show()
	else:
		resume_timer.stop()
		$Message.hide()
		resume_game.emit()
		start = 3		


func _on_confirmation_dialog_confirmed() -> void:
	get_tree().paused = false
	SoundManager.play_click_sound()
	SoundManager.game_music(false)
	SceneTransition.change_scene_to_file("res://main_menu.tscn")
	SoundManager.back_music()
	resume_bttn.hide()
	home_bttn.hide()


func _on_confirmation_dialog_canceled() -> void:
	SoundManager.play_click_sound()
