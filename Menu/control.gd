extends Control

var startButton: Button
var quitButton: Button

func _ready():
	# Carrega os botões
	startButton = $StartButton
	quitButton = $QuitButton

	startButton.grab_focus()

func _process(_delta):
	if Input.is_action_just_pressed("ui_right"):
		quitButton.grab_focus()
	elif Input.is_action_just_pressed("ui_left"):
		startButton.grab_focus()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/ScenePrefab.tscn")


func _on_quit_button_pressed():
	get_tree().quit()  
