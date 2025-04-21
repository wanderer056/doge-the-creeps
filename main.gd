extends Node

@export var mob_scene: PackedScene

var score


func _ready() -> void:
	new_game()
	SoundManager.back_music(false)

func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
#	$Music.stop()
	SoundManager.game_music(false)
#	$DeathSound.play()
	SoundManager.death_music()

	
func new_game() -> void:
	score = 0
	$HUD/HomeButton.hide()
	$HUD/RestartButton.hide()
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
#	$Music.play()
	SoundManager.game_music(true)	

	
func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()


func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	
	mob_spawn_location.progress_ratio = randf()
	var direction = mob_spawn_location.rotation + PI/2
	mob.position = mob_spawn_location.position

	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob) 


func _on_hud_pause_game() -> void:
	get_tree().paused = true


func _on_hud_resume_game() -> void:
	get_tree().paused = false
