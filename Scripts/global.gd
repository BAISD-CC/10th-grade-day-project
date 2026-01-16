extends Node

const howManyTiles := 1
const tileSize := 128
const distance_between_roads:= [-128, -256,-384,-768]
const minTimeRequired := 1.0
const maxTimeRequired :=2.5
var score := 0
var roadCount :=0
var highScore :=0
func _load():
	var file = FileAccess.open("user://savegame.save",FileAccess.READ)
	var json_string = file.get_line()
	var json_parse = JSON.parse_string(json_string)
	highScore = json_parse["Hi-Score"]
func _saveDictionary():
	if  score > highScore:
		highScore = score
	var saveDic = {
	"Hi-Score": highScore,
	}
	return saveDic
func _save():
	var file = FileAccess.open("user://savegame.save",FileAccess.WRITE)
	var diction = _saveDictionary()
	var json_string = JSON.stringify(diction)
	file.store_line(json_string)
	
