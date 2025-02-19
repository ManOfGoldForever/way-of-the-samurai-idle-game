extends Control

@onready var fullscreen_checkbox = $Background/MainContainer/VContainer/HBoxContainer/FullscreenCheckBox

func _ready():
	var video_settings = ConfigFileHandler.load_video_settings()
	fullscreen_checkbox.button_pressed = video_settings.fullscreen

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MenuScreen.tscn")

func _on_save_button_pressed() -> void:
	GameManager.save_game_data()

func _on_load_button_pressed() -> void:
	GameManager.load_game_data()

func _on_reset_button_pressed() -> void:
	GlobalBamboo.bamboo = 0
	GlobalBamboo.bamboo_price = 100
	GlobalVariables.yen = 0
	GlobalVariables.samurai = 0

func _on_fullscreen_check_box_toggled(toggled_on: bool) -> void:
	ConfigFileHandler.save_video_setting("fullscreen", toggled_on)
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif !toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
