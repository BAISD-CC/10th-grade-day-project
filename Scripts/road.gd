extends Node2D

var car = preload("res://Objects/World/Car.tscn")
@export var marker_2d: Marker2D 
@export var timer: Timer 

func _ready() -> void:
	timer.start(randi_range(1,2.3))



func _on_timer_timeout() -> void:
	var sceneCar = car.instantiate()
	sceneCar.global_position = marker_2d.global_position 
	add_child(sceneCar)
	timer.start(randi_range(1,2.3))


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
