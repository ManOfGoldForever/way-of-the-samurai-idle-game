extends Node

func _ready() -> void:
	HideSamurai()
	$AnimationPlayer.play("default")

func HideSamurai():
	$AnimationPlayer/Samurai1.hide()
	$AnimationPlayer/Samurai2.hide()
	$AnimationPlayer/Samurai3.hide()

func _process(_delta: float) -> void:
	if GlobalVariables.samurai == 1:
		$AnimationPlayer/Samurai1.show()
	elif GlobalVariables.samurai == 2:
		$AnimationPlayer/Samurai1.show()
		$AnimationPlayer/Samurai2.show()
	elif GlobalVariables.samurai >= 3:
		$AnimationPlayer/Samurai1.show()
		$AnimationPlayer/Samurai2.show()
		$AnimationPlayer/Samurai3.show()
	else:
		pass
