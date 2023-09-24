extends Node2D

@export var PHASE_INFO : Resource
@onready var texture = get_node("TextureRect")
@onready var spriteLeft = $CharacterLeft
@onready var spriteRight = $CharacterRight

var isInArea = false
var isInAreaRight = false
var portalLeft = ""
var portalRight = ""


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
	
	if PHASE_INFO.world == 1:
		$Nuvens.visible = true
	elif PHASE_INFO.world == 2:
		$Pantano.visible = true
	elif PHASE_INFO.world == 3:
		$Rico.visible = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$LeftPortal/AnimatedSprite2D.play("default")
	$RightPortal/AnimatedSprite2D.play("default")
	
	if(PHASE_INFO.willDie):
		$Morto.show()
	else:
		$Morto.hide()
	
	if(isInArea):
		spriteLeft.velocity.x -= 5
		spriteLeft.move_and_slide()
		
	if(isInAreaRight):
		spriteRight.velocity.x += 5
		spriteRight.move_and_slide()
		
func _on_right_portal_area_entered(area):
	if(area.is_in_group("Player")):
		State.currentPhase = portalRight
		get_tree().reload_current_scene()
	if(area.is_in_group("Target")):
		area.get_parent().queue_free()


func _on_left_portal_area_entered(area):
	if(area.is_in_group("Player")):
		State.currentPhase = portalLeft
		get_tree().reload_current_scene()
	if(area.is_in_group("Target")):
		area.get_parent().queue_free()


func _on_area_2d_area_entered(area):
	if(area.is_in_group("Player")):
		isInArea = true

func _on_area_2d_area_exited(area):
	if(area.is_in_group("Player")):
		isInArea = false

func _on_area_2d_right_area_entered(area):
	if(area.is_in_group("Player")):
		isInAreaRight = true

func _on_area_2d_right_area_exited(area):
	if(area.is_in_group("Player")):
		isInAreaRight = false
		
