extends Node2D

@export var PHASE_INFO : Resource
@onready var texture = get_node("TextureRect")
@onready var spriteLeft = $CharacterLeft
@onready var spriteRight = $CharacterRight

var isInArea = false
var isInAreaRight = false
var portalLeft = ""
var portalRight = ""
var leftVelocity =  0
var rightVelocity = 0

var leftExist = true
var rightExist = true

# Called when the node enters the scene tree for the first time.
func _ready():
	PHASE_INFO = load("res://Scripts/Resources/"+str(State.currentPhase)+".tres")
	portalLeft = PHASE_INFO.portalLeft
	portalRight = PHASE_INFO.portalRight
	spriteLeft.get_child(0).play(PHASE_INFO.leftEntity)
	spriteRight.get_child(0).play(PHASE_INFO.rightEntity)
	spriteLeft.scale.x = PHASE_INFO.spriteSideLeft
	spriteRight.scale.x = PHASE_INFO.spriteSideRight
	texture.texture = load(PHASE_INFO.background)
	
	if(PHASE_INFO.world == 0):
		#$Nuvens.visible = true
		pass
	elif PHASE_INFO.world == 1:
		$Nuvens.visible = true
	elif PHASE_INFO.world == 2:
		$Pantano.visible = true
	elif PHASE_INFO.world == 3:
		$Rico.visible = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$LeftPortal/AnimatedSprite2D.play(PHASE_INFO.leftEntity + "Idle")
	$RightPortal/AnimatedSprite2D.play(PHASE_INFO.rightEntity + "Idle")
	
	if(PHASE_INFO.willDie):
		$Morto.show()
	else:
		$Morto.hide()
	
	if(isInArea):
		$CharacterLeft/SpriteLeft.play(PHASE_INFO.leftEntity)
		
		spriteLeft.velocity.x -= leftVelocity
		leftVelocity += 0.020
		spriteLeft.move_and_slide()
	elif(leftExist):
		$CharacterLeft/SpriteLeft.play(PHASE_INFO.rightEntity + "Idle")
		if(spriteLeft.velocity.x < 0):
			spriteLeft.velocity.x = 0
		else:
			spriteLeft.velocity.x -= 0.01


	if(isInAreaRight):
		spriteRight.velocity.x += rightVelocity
		rightVelocity += 0.020
		spriteRight.move_and_slide()
	elif(rightExist):
		$CharacterLeft/SpriteLeft.play(PHASE_INFO.rightEntity + "Idle")
		if(spriteRight.velocity.x < 0):
			spriteRight.velocity.x = 0
		#else:
		#	spriteRight.velocity.x -= 0.01

func _on_right_portal_area_entered(area):
	if(area.is_in_group("Player")):
		State.currentPhase = portalRight
		get_tree().reload_current_scene()
	if(area.is_in_group("Target")):
		$AnimationPlayer.play("FadeOutRight")
		await($AnimationPlayer.animation_finished)
		area.get_parent().queue_free()


func _on_left_portal_area_entered(area):
	if(area.is_in_group("Player")):
		State.currentPhase = portalLeft
		get_tree().reload_current_scene()
	if(area.is_in_group("Target")):
		$AnimationPlayer.play("FadeOutLeft")
		await($AnimationPlayer.animation_finished)
		area.get_parent().queue_free()


func _on_area_2d_area_entered(area):
	if(area.is_in_group("Player")):
		isInArea = true

func _on_area_2d_area_exited(area):
	if(area.is_in_group("Player")):
		isInArea = false
		leftExist = false
		leftVelocity = -0.5

func _on_area_2d_right_area_entered(area):
	if(area.is_in_group("Player")):
		isInAreaRight = true
	
func _on_area_2d_right_area_exited(area):
	if(area.is_in_group("Player")):
		isInAreaRight = false
		rightExist = false
		rightVelocity = -0.5
