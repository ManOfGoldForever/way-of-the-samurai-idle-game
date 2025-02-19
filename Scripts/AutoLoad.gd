extends Node

var game_data : GameData

func _ready():
	game_data = GameData.new()
	load_game_data()

func save_game_data():
	game_data.yen = GlobalVariables.yen
	game_data.samurai = GlobalVariables.samurai
	game_data.bamboo = GlobalBamboo.bamboo
	game_data.bamboo_price = GlobalBamboo.bamboo_price
	var save_path = "user://player_data.tres"
	var error = ResourceSaver.save(game_data, save_path)
	if error:
		print("An error occurred while saving:", error)

func load_game_data():
	var load_path = "user://player_data.tres"
	var file = FileAccess.open(load_path, FileAccess.READ)  # Open the file for reading
	if file != null:
		var loaded_data = ResourceLoader.load(load_path) as GameData
		if loaded_data:
			game_data = loaded_data
			GlobalVariables.yen = game_data.yen
			GlobalVariables.samurai = game_data.samurai
			GlobalBamboo.bamboo = game_data.bamboo
			GlobalBamboo.bamboo_price = game_data.bamboo_price
		else:
			print("Error loading resource:", load_path)
		file.close()  # Don't forget to close the file after use
	else:
		print("File does not exist, using default values.")
