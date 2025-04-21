extends TextureButton

@onready var animation_player = $AnimationPlayer

func _on_toggled(p_button_pressed) -> void:
	print(p_button_pressed)
	if p_button_pressed:
		animation_player.play("toggle")
		print("original-pressed")
	else:
		animation_player.play_backwards("toggle")
		print("original_unpressed")

func change_state(p_state) -> void:
	if p_state:
		animation_player.play("toggle",-1,5.0)
		print("change_pressed")
	else:
		animation_player.play("toggle",-1,-5.0)
		self.set_pressed_no_signal(false)
		print("change_unpressed")
		
