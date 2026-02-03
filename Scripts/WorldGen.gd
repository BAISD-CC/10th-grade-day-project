extends Node2D


 
@export var chunks:Array[PackedScene] 
@onready var generate: Timer = $generate
@onready var roads: Node2D = $"../Roads"
@onready var main_camera: Camera2D = $"../MainCamera"
var camera_top :float
var camera_bottom :float
var previousRoad
var screen_height = ProjectSettings.get_setting("display/window/size/viewport_height")
var highest_row := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate.timeout.connect(_time_to_generate)
	camera_top = main_camera.global_position.y - screen_height/2
	camera_bottom = main_camera.global_position.y + screen_height/2
func _time_to_generate() -> void:
	var chunk :PackedScene= chunks[randi() % chunks.size()] # gives out a chunk between 0 and the index of the chunks array
	var chunk_instance := chunk.instantiate()
	if is_instance_of(chunk_instance, water) and (is_instance_of(previousRoad, road) and not is_instance_of(previousRoad,water)):
		chunk_instance.queue_free()
		return
	elif (not is_instance_of(chunk_instance,water) and is_instance_of(chunk_instance, road)) and previousRoad is water:
		chunk_instance.queue_free()
		return
	else:
		null
	
	
	previousRoad = chunk_instance
	print(previousRoad)
	chunk_instance.position.y = highest_row * -128
	roads.add_child(chunk_instance)
	highest_row +=1
	
	
