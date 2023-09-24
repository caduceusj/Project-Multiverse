extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	await(get_tree().create_timer(10.0).timeout)
	get_tree().change_scene_to_file("res://Menu/control.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
