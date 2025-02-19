extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainContainer/VContainer/ErrorLabel.hide()
	if GlobalVariables:
		GlobalVariables.YenChanged.connect(_on_main_screen_yen_changed)
		GlobalVariables.SamuraiChanged.connect(_on_main_screen_samurai_changed)
		GlobalVariables.ErrorStatus.connect(_on_main_screen_error_status)

func _on_main_screen_error_status(is_error: bool) -> void:
	if is_error:
		$MainContainer/VContainer/ErrorLabel.text = "You need atleast 5 yen to buy this!"
		$MainContainer/VContainer/ErrorLabel.show()
	else:
		$MainContainer/VContainer/ErrorLabel.hide()

func _on_main_screen_samurai_changed(value: Variant) -> void:
	$MainContainer/VContainer/SamuraiLabel.text = "[center][img]res://Art/Samurai.png[/img]" + str(value)

func _on_main_screen_yen_changed(value: Variant) -> void:
	$MainContainer/VContainer/YenLabel.text = "[center][img]res://Art/Yen.png[/img]" + str(value)

func _on_bird_button_pressed() -> void:
	$BirdButton/AudioStreamPlayer.play()
