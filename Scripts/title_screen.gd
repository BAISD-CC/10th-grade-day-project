extends Control

var main:=preload("res://Scenes/world.tscn")
var about:=preload("res://Scenes/About.tscn")

func pressed_play() -> void:
	get_tree().change_scene_to_packed(main)


func pressed_about() -> void:
	get_tree().change_scene_to_packed(about)
#hacky solution to implememt reference
