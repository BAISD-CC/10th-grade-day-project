extends Node2D

var car = preload("res://Objects/World/Car.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var timer: Timer = $Timer
var count = 0

func _ready() -> void:
	timer.start(randi_range(1,2.3))

func _process(delta: float) -> void:
	if count >10:
		queue_free()
		count -1



func _on_timer_timeout() -> void:
	var sceneCar = car.instantiate()
	sceneCar.position = marker_2d.position 
	add_child(sceneCar)
	timer.start(randi_range(0.5,1.3))
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	count -1
