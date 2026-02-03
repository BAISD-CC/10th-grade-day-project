extends Node



#Students can touch and play with.
const howManyTiles := 1
const tileSize := 128
const debug :=false #Optional, just allows the player to move freely up, down, left, and right to see how the world generates

#Holds the score value..... amount of roads generated and the highest score loaded.
var score := 0
var roadCount :=0
var highScore :=0
#quit when escape is pressed
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit(0)
#Loads save data in godot's user directory
func _load():
	var file = FileAccess.open("user://savegame.save",FileAccess.READ)
	if file:
		var json_string = file.get_line()
		var json_parse = JSON.parse_string(json_string)
		highScore = json_parse["Hi-Score"]
#creates the content of a save file and doesn't save if debug is on
func _saveDictionary():
	if  (score > highScore) and debug ==false:
		highScore = score
	var saveDic = {
	"Hi-Score": highScore,
	}
	return saveDic
#Saves the game's score in the godot user directory
func _save():
	var file = FileAccess.open("user://savegame.save",FileAccess.WRITE)
	if file:
		var diction = _saveDictionary()
		var json_string = JSON.stringify(diction)
		file.store_line(json_string)
	
