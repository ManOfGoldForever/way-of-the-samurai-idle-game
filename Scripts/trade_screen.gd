extends Control

signal BambooChanged(value)

var bamboo := 0
var bamboo_price := 100

func get_yen():
	return GlobalVariables.yen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var global_variables = get_node("/root/GlobalVariables")
	global_variables.connect("YenChanged", Callable(self, "_on_yen_changed"))
	var global_bamboo = get_node("/root/GlobalBamboo")
	global_bamboo.connect("BambooPriceChange", Callable(self, "_on_background_bamboo_price_change"))
	bamboo = GlobalBamboo.bamboo
	bamboo_price = GlobalBamboo.bamboo_price
	UpdateUI()

func UpdateUI():
	$Background/MainContainer/VContainer/BambooContainer/BambooLabel.text = "[center][img]res://Art/Bamboo Bundle.png[/img]Yen: " + str(bamboo_price)
	$Background/MainContainer/VContainer/YenLabel.text = "[center][img]res://Art/Yen.png[/img]" + str(get_yen())
	$Background/MainContainer/VContainer/BambooTotalLabel.text = "[center][img]res://Art/Bamboo Bundle.png[/img]" + str(bamboo)

func _on_yen_changed(value: Variant) -> void:
	$Background/MainContainer/VContainer/YenLabel.text = "[center][img]res://Art/Yen.png[/img]" + str(value)

func _on_bamboo_buy_button_pressed() -> void:
	if GlobalVariables.yen >= bamboo_price:
		GlobalVariables.add_yen(-bamboo_price)
		bamboo += 1
		BambooChanged.emit(bamboo)
		UpdateUI()

func _on_bamboo_sell_button_pressed() -> void:
	if bamboo >= 1:
		bamboo -= 1
		GlobalVariables.add_yen(bamboo_price)
		BambooChanged.emit(bamboo)
		UpdateUI()

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainScreen.tscn")

func _on_background_bamboo_price_change(value: Variant) -> void:
	bamboo_price = value
	UpdateUI()
