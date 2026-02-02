extends Node2D
class_name road
const maxAmountRoads = 100

static var counter := 0

@export var timer: Timer 
@export   var markers: Node2D 
@export_category("Object to load")
@export var object:PackedScene
var dir:int
var laneSpeed = randf_range(500,620)

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	dir = randi_range(0,1)
	print(var_to_str(counter))
	timer.start(randf_range(1.2,1.8))
	if counter < maxAmountRoads:
		counter +=1
	
func _on_timer_timeout() -> void:
	var object = self.object.instantiate()
	var children = markers.get_children()
	object.position = children[dir].position
	object.BaseSPEED = laneSpeed
	if (dir ==0):
		object.dir = 1
	else:
		object.dir = -1
	add_child(object)
