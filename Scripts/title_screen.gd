extends Control

var main:=preload("res://Scenes/world.tscn")
var about:=preload("res://Scenes/About.tscn")

@onready var hi_score_display: Label = $"Hi-Score Display"

func _ready() -> void:
	Global._load()
	hi_score_display.text ="High Score: " + var_to_str(Global.highScore)


func pressed_play() -> void:
	get_tree().change_scene_to_packed(main)


func pressed_about() -> void:
	get_tree().change_scene_to_packed(about)
#hacky solution to implememt reference
