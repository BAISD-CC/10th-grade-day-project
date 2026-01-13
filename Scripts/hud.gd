extends Control
@onready var display: Label = $Display
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	display.text = "Score: " + var_to_str(Global.score)
