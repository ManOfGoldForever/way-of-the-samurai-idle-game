extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		get_tree().change_scene_to_file("res://Scenes/MainScreen.tscn")

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainScreen.tscn")

func _on_quit_button_pressed() -> void:
	GameManager.save_game_data()
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/SettingsScreen.tscn")
