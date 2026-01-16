extends Node2D

@onready var timer: Timer = $Timer
@onready var markers: Node2D = $Markers
const platform = preload("res://Objects/World/WaterLog.tscn")
const maxLogsPerRoad = 5 #cars per road 
var logCount = 0
var dir:int

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	var platform_instance = platform.instantiate()
	var children = markers.get_children()
	platform_instance.position = children[dir].position
	if (platform_instance.dir ==0):
		platform_instance.dir = 1
	else:
		platform_instance.dir = -1
	if (logCount < maxLogsPerRoad):
		add_child(platform_instance)
		logCount+=1
	timer.start(randi_range(0.5,1.3))
	
