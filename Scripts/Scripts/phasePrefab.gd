extends Node2D

@export var PHASE_INFO : Resource
@onready var texture = get_node("TextureRect")
@onready var spriteLeft = get_node("SpriteLeft")
@onready var spriteRight = get_node("SpriteRight")


var portalLeft = ""
var portalRight = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	PHASE_INFO = load("res://Scripts/Resources/"+str(State.currentPhase)+".tres")
	portalLeft = PHASE_INFO.portalLeft
	portalRight = PHASE_INFO.portalRight
	spriteLeft.play(PHASE_INFO.leftEntity)
	spriteRight.play(PHASE_INFO.rightEntity)
	texture.texture = load(PHASE_INFO.background)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(PHASE_INFO.willDie):
		$Morto.show()
	else:
		$Morto.hide()
	



func _on_right_portal_area_entered(area):
	if(area.is_in_group("Player")):
		State.currentPhase = portalRight
		get_tree().reload_current_scene()


func _on_left_portal_area_entered(area):
	if(area.is_in_group("Player")):
		State.currentPhase = portalLeft
		get_tree().reload_current_scene()
