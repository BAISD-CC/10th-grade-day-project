extends Node2D
@export var chunks:Array[PackedScene] 
@onready var generate: Timer = $generate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate.timeout.connect(_time_to_generate)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _time_to_generate() -> void:
	var chunk :PackedScene= chunks[randi() % chunks.size()] # gives out a chunk between 0 and the index of the chunks array
	var chunk_instance := chunk.instantiate()
	print()
	var canSpawn = randi() %6
	
	for i in range(6):
		if i!=canSpawn:
			chunk_instance.position = Vector2(0,Global.distance_between_roads[i])
			add_child(chunk_instance)
	
