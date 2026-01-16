extends Control

var title:=load("res://Scenes/Title_Screen.tscn")

func pressed_back() -> void:
	get_tree().change_scene_to_packed(title)
