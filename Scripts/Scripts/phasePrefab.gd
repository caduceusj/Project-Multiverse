extends Node2D

@export var PHASE_INFO : Resource
@onready var texture = get_node("TextureRect")
@onready var spriteLeft = get_node("SpriteLeft")
@onready var spriteRight = get_node("SpriteRight")


var portalLeft = ""
var portalRight = ""



# Called when the node enters the scene tree for the first time.
func _ready():
	PHASE_INFO = load("res://Scripts/Resources/"+State.currentPhase+".tres")
	portalLeft = PHASE_INFO.portalLeft
	portalRight = PHASE_INFO.portalRight
	spriteLeft.play(PHASE_INFO.leftEntity)
	spriteRight.play(PHASE_INFO.rightEntity)
	texture = load(PHASE_INFO.background)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_portal_body_entered(body):
	State.currentPhase = 2
	EzTransitions.change_scene(portalLeft)


func _on_right_portal_body_entered(body):
	EzTransitions.change_scene(portalRight)
