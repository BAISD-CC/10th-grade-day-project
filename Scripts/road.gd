extends Node2D
class_name road
const maxAmountRoads = 100

static var counter := 0

@export var timer: Timer 
@export   var markers: Node2D 
@export_category("Object to load")
@export var object:PackedScene
var dir:int

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	dir = randi_range(0,1)
	print(var_to_str(counter))
	if counter < maxAmountRoads:
		counter +=1
	else:
		queue_free()
func _on_timer_timeout() -> void:
	timer.stop()
	var object = self.object.instantiate()
	var children = markers.get_children()
	object.position = children[dir].position
	if (dir ==0):
		object.dir = 1
	else:
		object.dir = -1
	add_child(object)
	timer.start(randf_range(1,2.3))
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	
