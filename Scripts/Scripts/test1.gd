extends Node2D

func _ready():
	EzTransitions.set_easing(1, 1)
	EzTransitions.set_trans(5, 5)
	EzTransitions.set_timers(1.0, 0, 0.5)
	EzTransitions.set_reverse(true, true)
	EzTransitions.set_textures("res://Sprites/test/GALAXY.jpg", "res://Sprites/test/GALAXY.jpg")
	EzTransitions.set_types(4, 4)
	EzTransitions.change_scene("res://Scenes/Test/test2.tscn")

