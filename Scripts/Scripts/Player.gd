extends CharacterBody2D


const SPEED = 300.0

func _ready():
	print("Entrou no céu")

func _physics_process(delta):
	# Add the gravity.

	# Handle Jump.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	move_and_slide()

func _process(delta):
	if(velocity.x != 0):
		$AnimatedSprite2D.play("Walking")
		if(velocity.x > 0):
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("Idle")
