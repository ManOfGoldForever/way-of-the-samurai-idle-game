extends Node

func _on_samurai_timer_timeout() -> void:
	GlobalVariables.add_yen(GlobalVariables.samurai_total_yen)
