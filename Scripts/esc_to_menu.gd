extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu") and get_tree().current_scene.name != "MenuScreen":
		get_tree().change_scene_to_file("res://Scenes/MenuScreen.tscn")
