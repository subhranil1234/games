extends CharacterBody2D

var win_height: int
var p_height: int

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.size.y

func _process(delta):
	velocity = Vector2.ZERO  # Reset velocity

	if Input.is_action_pressed("ui_up"):
		velocity.y = -get_parent().PADDLE_SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = get_parent().PADDLE_SPEED

	move_and_slide()  # Move the paddle
	
	# Keep within bounds
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
