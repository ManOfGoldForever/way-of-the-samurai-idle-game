extends Node

func _on_save_timer_timeout() -> void:
	GameManager.save_game_data()
