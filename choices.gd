extends CanvasLayer

@export_category("grouping")
@export var group_ch : ButtonGroup
var d_choice : Dictionary
signal next_id(id : String)

func _ready() -> void:
	group_ch.pressed.connect(get_choice)


func set_choices(choices : Dictionary):
	d_choice = choices
	print(choices)
	var i = 0
	var btnI = group_ch.get_buttons()
	for c in choices.keys():
		print(c)
		btnI[i].text = c
		i += 1
		
func get_choice(b : Button):
	var id = d_choice[b.text]
	next_id.emit(id)
