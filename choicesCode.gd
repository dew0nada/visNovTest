extends CanvasLayer

@export_category("btn group")
@export var group_ch : ButtonGroup

func set_choices(choices : Dictionary):

	var index = 0
	var btnI = group_ch.get_buttons()
	for c in choices.keys():
		print(c)
		btnI[index].text = c
		index += 1 
		
		
		
