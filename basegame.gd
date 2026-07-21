extends Control



var jsonSrc: String = "res://script.json"
var scene_script : Dictionary
var current_block : Dictionary
var next_block : Dictionary

@export_category("scene_ref")
@export var charName : Label
@export var charText : Label
@export var charSprite : AnimatedSprite2D
@export var choiceSys : CanvasLayer

func _ready() -> void:
	get_json(jsonSrc)
	load_block(current_block)



func get_json(scr: String):
	var jsonText = FileAccess.get_file_as_string(scr)
	scene_script = JSON.parse_string(jsonText)
	current_block = scene_script["start"]



func load_block(block : Dictionary):
	if block.has("text") : 
		charName.text = block["name"]
		charText.text = block["text"]
		charSprite.play(block["mood"])
	if block.has("next") :
		var key : String = block["next"]
		next_block = scene_script[key]
	elif block.has("choices"):
		choiceSys.show()
		choiceSys.set_choices(block["choices"])
		
func next():
	if next_block == null:
		get_tree().quit()
	else:
		current_block = next_block
		load_block(current_block)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		next()
