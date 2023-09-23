extends Node2D

@export var PHASE_INFO : Resource
@onready var texture = get_node("TextureRect")
#@onready var spriteLeft = get_node("SpriteLeft")
@onready var spriteLeft = $CharacterBody2D
#@onready var spriteRight = get_node("SpriteRight")
@onready var spriteRight = $SpriteRight

var isInArea = false
var portalLeft = ""
var portalRight = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	PHASE_INFO = load("res://Scripts/Resources/"+str(State.currentPhase)+".tres")
	portalLeft = PHASE_INFO.portalLeft
	portalRight = PHASE_INFO.portalRight
	spriteLeft.get_child(0).play(PHASE_INFO.leftEntity)
	spriteRight.play(PHASE_INFO.rightEntity)
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
func _on_right_portal_area_entered(area):
	if(area.is_in_group("Player")):
		State.currentPhase = portalRight
		get_tree().reload_current_scene()


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
