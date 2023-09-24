extends Control


func _ready():
	pass

func _process(_delta):
	$RightPortal/AnimatedSprite2D.play("default")
	$LeftPortal/AnimatedSprite2D.play("default")



	#get_tree().quit()  


func _on_left_portal_area_entered(area):
	if(area.is_in_group("Player")):
		get_tree().change_scene_to_file("res://Scenes/scene_prefab2.tscn")





func _on_right_portal_area_entered(area):
	if(area.is_in_group("Player")):
		get_tree().quit()  
