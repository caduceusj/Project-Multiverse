extends Node2D

@export var PHASE_INFO : Resource
@onready var texture = get_node("TextureRect")
#@onready var spriteLeft = get_node("SpriteLeft")
@onready var spriteLeft = $CharacterBody2D
#@onready var spriteRight = get_node("SpriteRight")
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
	texture.texture = load(PHASE_INFO.background)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
