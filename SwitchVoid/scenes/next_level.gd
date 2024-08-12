extends Area2D


func _ready():
	$AnimatedSprite2D.play("orb1")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		nextLevel()

func _input(_event):
	if Input.is_action_just_pressed("skip"):
		nextLevel()

func nextLevel():
	$finish_level.play()
	await get_tree().create_timer(1.4).timeout
	var current_scene = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene.to_int() + 1
	
	var next_level_path = "res://scenes/map" + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
