extends Area2D

@export var locationTarget : String

func _on_body_entered(body):
	if(body.name == "Player"):
		print("Enntrou")
		EzTransitions.change_scene("res://Scenes/Levels/"+locationTarget+".tscn")
		
