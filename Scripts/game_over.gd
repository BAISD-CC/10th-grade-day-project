extends Control

@onready var high_score: Label = $"High Score"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global._load()
	high_score.text = "Current High Score: " + var_to_str(Global.highScore)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://Scenes/Title_Screen.tscn")
