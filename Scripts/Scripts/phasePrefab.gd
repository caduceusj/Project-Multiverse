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


var isPlayingRight = false
var isPlayingLeft = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$LeftPortal/AnimatedSprite2D.play("default")
	$RightPortal/AnimatedSprite2D.play("default")
	
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


func _physics_process(delta):
	if(isInAreaRight):
		spriteRight.velocity.x += rightVelocity
		rightVelocity += 0.020
		spriteRight.move_and_slide()
		print("BBBBBBBBBBBB")
	elif(rightExist):
		spriteRight.velocity.x = 0

			
	if(isInArea):
		spriteLeft.velocity.x -= leftVelocity
		leftVelocity += 0.020
		print("AAAAAAAAAAA")
		spriteLeft.move_and_slide()
	elif(leftExist):
		spriteLeft.velocity.x = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(PHASE_INFO.willDie):
		$Morto.show()
	else:
		$Morto.hide()
	

		
		
		
	if(leftExist):
		if(spriteLeft.velocity.x == 0):
			$CharacterLeft/SpriteLeft.play(PHASE_INFO.leftEntity+"Idle")
		else:
			$CharacterLeft/SpriteLeft.play(PHASE_INFO.leftEntity)
	if(rightExist):
		if(spriteRight.velocity.x == 0):
			$CharacterRight/SpriteRight.play(PHASE_INFO.rightEntity+"Idle")
		else:
			$CharacterRight/SpriteRight.play(PHASE_INFO.rightEntity)
	
	
	


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

func _on_area_2d_right_area_entered(area):
	if(area.is_in_group("Player")):
		isInAreaRight = true
	
func _on_area_2d_right_area_exited(area):
	if(area.is_in_group("Player")):
		isInAreaRight = false
		rightExist = false
