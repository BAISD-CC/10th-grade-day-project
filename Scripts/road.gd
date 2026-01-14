extends Node2D

@onready var marker_2d: Marker2D = $Marker2D
@onready var timer: Timer = $Timer
@onready var markers: Node2D = $Markers
const car = preload("res://Objects/World/Car.tscn")
const maxCars = 2 #cars per road 

var carCount = 0
var dir:int

func _ready() -> void:
	timer.start(randi_range(1,2.3))
	dir = randi_range(0,1)

func _on_timer_timeout() -> void:
	var sceneCar = car.instantiate()
	var children = markers.get_children()
	sceneCar.position = children[dir].position
	if (dir ==0):
		sceneCar.dir = 1
	else:
		sceneCar.dir = -1
	if (carCount < maxCars):
		add_child(sceneCar)
		carCount+=1
	timer.start(randi_range(0.5,1.3))
	
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	Global.roadCount -=1
