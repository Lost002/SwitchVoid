extends Node2D

@onready var tile1 = $b
@onready var tile2 = $p
@onready var player = $"../CharacterBody2D"

var tile1_vis = true # collision layer 1
var tile2_vis = false # collision layer 2

# Called when the node enters the scene tree for the first time.
func _ready():
	tile2.visible = false
	player.set_collision_layer_value(1, tile1_vis)
	player.set_collision_layer_value(2, tile2_vis)

func _input(event):
	if event.is_action_pressed("toggle"): # Replace "ui_select" with your actual input action name
		toggle_nodes()

func toggle_nodes():
	tile1_vis = !tile1_vis
	tile2_vis = !tile2_vis
	
	player.set_collision_mask_value(1, tile1_vis)
	player.set_collision_mask_value(2, tile2_vis)
	
			
	tile1.visible = tile1_vis
	tile2.visible = tile2_vis
