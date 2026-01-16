extends Node2D
@export var chunks:Array[PackedScene] 
@onready var generate: Timer = $generate
@onready var roads: Node2D = $"../Roads"
@onready var main_camera: Camera2D = $"../MainCamera"

var highest_row := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate.timeout.connect(_time_to_generate)
	
func _time_to_generate() -> void:
	var chunk :PackedScene= chunks[randi() % chunks.size()] # gives out a chunk between 0 and the index of the chunks array
	var chunk_instance := chunk.instantiate()
	chunk_instance.position.y = highest_row * -128
	roads.add_child(chunk_instance)
	highest_row +=1
	
	
