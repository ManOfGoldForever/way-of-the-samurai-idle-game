extends Node

@export_category("Stock Market")
@export_group("Balancing")
@export var min_bamboo_cost := 100
@export var factor := 2

func _on_stock_timer_timeout() -> void:
	GlobalBamboo.generate_stock_prices(min_bamboo_cost, GlobalVariables.yen, factor)
