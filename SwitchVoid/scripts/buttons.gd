extends Control


#func _on_play_button_mouse_entered():
#	hover_on()
#
#
#func _on_play_button_mouse_exited():
#	hover_off()



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map1.tscn")
