extends Node2D

var car = preload("res://Objects/World/Car.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start(randi_range(1,2.3))

func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	var sceneCar = car.instantiate()
	sceneCar.position = marker_2d.position 
	add_child(sceneCar)
	timer.start(randi_range(0.5,1.3))
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	Global.roadCount -=1
