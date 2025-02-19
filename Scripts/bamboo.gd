extends TextureRect

signal BambooPriceChange(value)

var bamboo = 0
var bamboo_price = 100

func _ready() -> void:
	bamboo = GlobalBamboo.bamboo
	randomize()

func _on_trade_screen_bamboo_changed(value: Variant) -> void:
	bamboo = value
	GlobalBamboo.bamboo = value

func _on_trade_screen_bamboo_price(value: Variant) -> void:
	bamboo_price = value
	GlobalBamboo.bamboo_price = value

func generate_stock_prices(min_bamboo_cost, yen, factor):
	bamboo_price = floor(randf_range(min_bamboo_cost, yen * factor))
	GlobalBamboo.bamboo_price = bamboo_price
	BambooPriceChange.emit(bamboo_price)
