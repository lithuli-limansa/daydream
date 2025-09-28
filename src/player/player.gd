extends CharacterBody2D


@export var speed : float = 130.0
@export var jump_velocity : float = -300.0
@export var animated_sprite : AnimatedSprite2D
@export var coins_label : Label

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	update_hud_coins()
	
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if animated_sprite.animation != "jump":
			animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	
	
func update_hud_coins() -> void:
	coins_label.text = "Coins : " + str(GameManager.current_collected_coins)
