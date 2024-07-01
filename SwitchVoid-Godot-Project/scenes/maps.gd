extends Node2D # Assuming this script is attached to a Node2D that acts as a controller for p1 and p2

var p1_visible = false
var p2_visible = true
var p1_children = []
var p2_children = []

@onready var bg = $CanvasLayer/ColorRect

func _ready():
	
	toggle_nodes()
	
	for child in $p1.get_children():
		for child2 in child.get_children():
			for child3 in child2.get_children():
				p1_children.append(child3)
		
	for child in $p2.get_children():
		for child2 in child.get_children():
			for child3 in child2.get_children():
				p2_children.append(child3)

	for collider in p2_children:
		collider.disabled = true
	for collider in p1_children:
		collider.disabled = false

func _input(event):
	if event.is_action_pressed("toggle"): # Replace "ui_select" with your actual input action name
		toggle_nodes()
		$swap.play()

func toggle_nodes():
	p1_visible =!p1_visible
	p2_visible =!p2_visible
	
	
	#   #06050f p1
	#   #1f224d p2
	
	if p1_visible:
		bg.color = "#101531"
		for collider in p1_children:
			collider.disabled = false
		for collider in p2_children:
			collider.disabled = true
	elif p2_visible:
		bg.color = "#172E48"
		for collider in p1_children:
			collider.disabled = true
		for collider in p2_children:
			collider.disabled = false
			
	$p1.visible = p1_visible
	$p2.visible = p2_visible
