extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const WALL_JUMP_PUSH_BACK = 400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var eyes = $eyes
@onready var ray = $RayCast2D

var initial_pos
var maps = []
var load_map = 0

func _ready():
	initial_pos = position

func _physics_process(delta):
	if Input.is_action_just_pressed("left"):
		eyes.position.x = lerp(eyes.position.x,-10.0,0.5)
	elif Input.is_action_just_released("left"):
		eyes.position.x = lerp(eyes.position.x,0.0,0.5)
	elif Input.is_action_just_pressed("right"):
		eyes.position.x = lerp(eyes.position.x,10.0,0.5)
	elif Input.is_action_just_released("right"):
		eyes.position.x = lerp(eyes.position.x,0.0,0.5)
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if "death" in str(ray.get_collider()):
		position = initial_pos
		die()
		
	
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY - 50
		jump()
	
	elif Input.is_action_just_pressed("jump") and is_on_wall():
		velocity.y = JUMP_VELOCITY
		velocity.x = get_wall_normal().x * WALL_JUMP_PUSH_BACK
		jump()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, 36.0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func jump():
	$jump.pitch_scale = randf_range(0.9,1.1)
	$jump.play()
	
func die():
	$die.pitch_scale = randf_range(0.9,1.1)
	$die.play()
