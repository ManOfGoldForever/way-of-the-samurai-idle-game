extends Control

var yen = 0
var samurai = 0
@export_category("Yen and Samurai")
@export_group("Balancing")
@export var samurai_cost = 5
@export var yen_per_samurai = 1
@export var yen_per_click = 1
var samurai_total_yen = samurai * yen_per_samurai

signal YenChanged(value)
signal SamuraiChanged(value)
signal ErrorStatus(bool)

func UpdateVariables():
	samurai_total_yen = samurai * yen_per_samurai
	GlobalVariables.yen = yen
	GlobalVariables.samurai = samurai
	GlobalVariables.samurai_total_yen = samurai_total_yen

func _ready() -> void:
	yen = GlobalVariables.yen
	samurai = GlobalVariables.samurai
	samurai_total_yen = GlobalVariables.samurai_total_yen
	YenChanged.emit(yen)
	SamuraiChanged.emit(samurai)

func add_yen(amount):
	yen += amount
	var main_screen = get_node_or_null("/root/MainScreen")
	if main_screen:
		main_screen.yen = yen  # <-- Sync the yen value
		main_screen.YenChanged.emit(yen)  # <-- Ensure UI updates too
	else:
		GlobalVariables.yen = yen
	YenChanged.emit(yen)
	UpdateVariables()

func _on_yen_button_pressed() -> void:
	yen += yen_per_click
	YenChanged.emit(yen)
	ErrorStatus.emit(false)
	UpdateVariables()

func _on_buy_button_pressed() -> void:
	if yen >= samurai_cost:
		yen -= samurai_cost
		samurai += 1
		samurai_total_yen = samurai * yen_per_samurai
		UpdateVariables()
		YenChanged.emit(yen)
		SamuraiChanged.emit(samurai)
		ErrorStatus.emit(false)
	else:
		ErrorStatus.emit(true)

func _on_trade_button_pressed() -> void:
	UpdateVariables()
	get_tree().change_scene_to_file("res://Scenes/TradeScreen.tscn")
